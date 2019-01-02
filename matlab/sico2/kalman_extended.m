function kalman_extended

n_iter  = 100
delta   = 0.1
total_t = n_iter*delta
p        = 4 % rx,ry,vx,vy  
m        = 2 % range, bearing
     
x    = N.zeros( m )      # observation

xhat = N.zeros( m )      # estimation
h    = N.zeros( m )      # geometry

h_save      = N.zeros( (n_iter,m) )
x_save      = N.zeros( (n_iter,m) )

K1_save      = N.zeros( (n_iter,p) )
K2_save      = N.zeros( (n_iter,p) )

Mpos_save    = N.zeros( n_iter )
Mspeed_save  = N.zeros( n_iter )

shat_save   = N.zeros( (n_iter,p) )
time_k      = N.zeros( n_iter )

M = N.zeros( (p,p) )      # minimum predicction MSE
H = N.zeros( (m,p) )      # variance matrix
K = N.zeros( (p,m) )      # Kalman gain


sigma_u    = 0.001 

sigma_R    = 1 # 1, 0.1, 0.1
sigma_Beta = 0.01

C_s = N.matrix ([[sigma_R, 0], [0, sigma_Beta]]) # variance matrix

A   = N.matrix ([[ 1 , 0, delta, 0], [0, 1, 0, delta ], \
		[0,0,1,0 ],[0,0,0,1] ]) # dynamic array
#   the first rows are zero since the first two have sensors, and the other are
# estimations from the observer 
Q   = N.matrix ([[ 0 , 0, 0, 0], [0, 0, 0, 0 ], \
		[0,0,sigma_u,0 ],[0,0,0,sigma_u ] ])

# initial guesses
shat = N.matrix([ [5],[5],[ 0 ],[ 0 ]])
M    = N.matrix( 100* N.identity(p) )
# real values
pos_x = 10
pos_y = -5

vel_x = -0.2
vel_y =  0.2

rx = N.zeros( n_iter )   
ry = N.zeros( n_iter )   
for k in range(0,n_iter):
  time_k[k] = delta*k
  # real values, line
  rx[k]    = pos_x + vel_x* delta*k
  ry[k]    = pos_y + vel_y* delta*k

  h_n   =  N.matrix([ [ N.sqrt(rx[k]**2+ry[k]**2)  ] ,[ N.arctan2(ry[k] ,rx[k] )] ])
  # time update
  shat = A * shat
  M    = A * M* A.T + Q# B = I

 # observations
  noise =  N.matrix([ [  sigma_R*N.random.randn() ] ,[ sigma_Beta*N.random.randn()  ] ])
  x     =  h_n + noise
  # predictions
  h_hat =  N.matrix([ [ N.sqrt(shat[0,0]**2+shat[1,0]**2)  ] ,[ N.arctan2(shat[1,0] ,shat[0,0] )]])

  rx_n    = rx[k] # x[0,0]
  ry_n    = ry[k] # x[1,0]
  H   =  N.matrix ([ [ rx_n/N.sqrt(rx_n**2+ry_n**2) , ry_n /N.sqrt(rx_n**2+ry_n**2) , 0, 0], [ -ry_n/(rx_n**2+ry_n**2),rx_n/(rx_n**2+ry_n**2), 0, 0 ] ])
  factor = C_s + H*M*H.T
  K    =  M*H.T*N.linalg.inv(factor)
  # update
  shat  = shat + K*(x-h_hat)
  M     =   (N.matrix( N.identity(p) ) - K*H )*M
  shat_save[k,:] = N.array( shat.T) # [rx ,ry, vx,vy]
  h_save[k,:] = N.array( h_n.T)
  x_save[k,:] = N.array( x.T)
  K1_save[k,:] = N.array( K[:,0].T)
  K2_save[k,:] = N.array( K[:,1].T)

  Mpos_save[k]   = N.sqrt(M[0,0]**2+M[1,1]**2)  # position magnitude
  Mspeed_save[k] = N.sqrt(M[2,2]**2+M[3,3]**2)  # speed magnitude

mystring = "%s  %2.4f %s %2.3f  %s %2.3f " % ("$\sigma^2_u =$",sigma_u ,"$\sigma^2_R =$" , sigma_R,"$\sigma^2_{\\beta} =$",sigma_Beta )
pl.figure(1)
pl.subplots_adjust(left=0.06 , bottom=0.09 , right=0.96 , top=0.94,
                wspace=0.02, hspace=0.20 )
ax1 = pl.subplot(121)
ax1.plot(time_k,N.sqrt( shat_save[:,0]**2 +shat_save[:,1]**2  ),'k-',label='Estimation')
ax1.plot(time_k,h_save[:,0],'k--',label='Real value  ')
ax1.plot(time_k,x_save[:,0],'ks',label='Measurement')
pl.xlabel('Time')
pl.ylabel('Range')
pl.title(mystring)
pl.legend()
pl.grid()
ax2 = pl.subplot(122)
ax2.plot(time_k,N.sqrt( shat_save[:,2]**2 +shat_save[:,3]**2  ),'k-',label='Estimation')
speed = N.sqrt(vel_x**2 + vel_y**2) 
ax2.plot( (time_k[0],time_k[-1]) , ( speed, speed ) ,'k--',label='Real value')
pl.xlabel('Time')
pl.ylabel('Speed')
pl.legend()
pl.grid()


pl.figure(2)
pl.subplots_adjust(left=0.06 , bottom=0.09 , right=0.96 , top=0.94,
                wspace=0.02, hspace=0.20 )
ax1 = pl.subplot(211)
ax1.plot(time_k, K1_save[:,0] ,'k-',label='11')
ax1.plot(time_k, K1_save[:,1] ,'k+',label='21')
ax1.plot(time_k, K1_save[:,2] ,'k--',label='31')
ax1.plot(time_k, K1_save[:,3] ,'k.-',label='41')
pl.xlabel('Time')
pl.ylabel('K')
pl.title(mystring)
pl.legend()
pl.grid()
ax2 = pl.subplot(212)
ax2.plot(time_k, K2_save[:,0] ,'k-',label='11')
ax2.plot(time_k, K2_save[:,1] ,'k+',label='21')
ax2.plot(time_k, K2_save[:,2] ,'k--',label='31')
ax2.plot(time_k, K2_save[:,3] ,'k.-',label='41')
pl.xlabel('Time')
pl.ylabel('K')
pl.legend()
pl.grid()
pl.figure(3)
ax1 = pl.subplot(211)
ax1.plot(time_k, Mpos_save ,'k-')
pl.xlabel('Time')
pl.ylabel('MMSE range')
pl.title(mystring)
pl.grid()

ax2 = pl.subplot(212)
ax2.plot(time_k, Mspeed_save ,'k-')
pl.xlabel('Time')
pl.ylabel('MMSE speed')
pl.grid()

pl.show()

