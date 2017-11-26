import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class racecondition {
    static int i = 0;
    static int mi = 0;
    static volatile int vi = 0;
    static AtomicInteger ai = new AtomicInteger(0);
    static Lock mutex = new ReentrantLock();

    static class rinc_vol implements Runnable {
        @Override
        public void run(){
            for (int c = 0; c < 10000; c++) {
                vi ++;
            }
        }
    }

    static class rinc_ai implements Runnable {
        @Override
        public void run(){
            for (int c = 0; c < 10000; c++) {
               ai.incrementAndGet();
            }
        }
    }

    synchronized static void incr_sync(){
        i++;
    }

    static class rinc_sync implements Runnable {
        @Override
        public void run(){
            for (int c = 0; c < 10000; c++) {
                incr_sync();
            }
        } 
    }

    static class rinc_mutex implements Runnable{
        @Override
        public void run(){
            for (int c = 0; c < 10000; c++) {
                mutex.lock();
                mi++;
                mutex.unlock();
            }
        }
    }
    

    public static void main(final String[] args) {
        long start = System.nanoTime();
        Thread t1 = new Thread( new rinc_vol());
        Thread t2 = new Thread( new rinc_vol());
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
	}
	catch (final InterruptedException e) {
            e.printStackTrace();
	}
        System.out.println(" Nanotime: " + (System.nanoTime() - start));        
        System.out.println("Volatile = " + vi);
        System.out.println("----------------------------");
       
        start = System.nanoTime(); 
        t1 = new Thread( new rinc_ai());
        t2 = new Thread( new rinc_ai());
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
	}
	catch (final InterruptedException e) {
            e.printStackTrace();
	}

        System.out.println(" Nanotime: " + (System.nanoTime() - start));        
        System.out.println("Atomic integer= " + ai.intValue());
        System.out.println("----------------------------");

        t1 = new Thread( new rinc_sync());
        t2 = new Thread( new rinc_sync());
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
	}
	catch (final InterruptedException e) {
            e.printStackTrace();
	}
        System.out.println(" Nanotime: " + (System.nanoTime() - start));        
        System.out.println(" sync = " + i); 
        System.out.println("----------------------------");

        t1 = new Thread( new rinc_mutex());
        t2 = new Thread( new rinc_mutex());
        t1.start();
        t2.start();
        try {
            t1.join();
            t2.join();
	}
	catch (final InterruptedException e) {
            e.printStackTrace();
	}
        System.out.println(" Nanotime: " + (System.nanoTime() - start));        
        System.out.println(" mutex = " + mi); 
        System.out.println("----------------------------");
    }
}

/*
 Some results 
  Nanotime: 2145863
Volatile = 20000
----------------------------
 Nanotime: 1989349
Atomic integer= 20000
----------------------------
 Nanotime: 5676112
 sync = 20000
----------------------------
 Nanotime: 13438372
 mutex = 20000

 volatile / atomic < sync << mutex

 Java documentation states that:
 All classes have get and set methods that work like reads and writes on volatile variables.

 maybe atomic operations are fast, I don't know that.but in this test atomic operations run fast.

   */
