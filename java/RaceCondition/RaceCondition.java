public class RaceCondition {

	public static class singleton {
		private int i = 0;
		private static singleton instance = null;

		protected singleton() {
		}

		public static singleton getInstance() {
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
		final ThreadGroup tg = new ThreadGroup("My_thread_group");

		for (int i = 0; i < 100; i++) {
			final Thread t1 = new Thread(tg, new rinc());
			final Thread t2 = new Thread(tg, new rdec());
			t1.start();
			t2.start();

		}
		while (tg.activeCount() > 0) {
			// wait!
		}
		System.out.println("final: " + singleton.getInstance().getvalue());
	}
}
