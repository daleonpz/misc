public class RaceCondition_volatile{

	public static class singleton {
		private volatile int i = 0;
		private static singleton instance = null;

		protected singleton() {
		}

		public synchronized static singleton getInstance() {
			return instance;
		}

		public static void setsingleton() {
			if (instance == null) {
				instance = new singleton();
			}
		}

		public int getvalue() {
			return this.i;
		}
	}

	static class rinc implements Runnable {
		@Override
		public void run() {
			for (int c = 0; c < 100; c++) {
				singleton.getInstance().i++;
			}
		}
	}

	static class rdec implements Runnable {
		@Override
		public void run() {
			for (int c = 0; c < 100; c++) {
				singleton.getInstance().i--;
			}
		}
	}

	public static void main(final String[] args) {
            singleton.setsingleton();

            final Thread t1 = new Thread(new rinc());
            final Thread t2 = new Thread(new rdec());
            t1.start();
            t2.start();

            try{
                t1.join();
                t2.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            System.out.println("final: " + singleton.getInstance().getvalue());
	}
}
