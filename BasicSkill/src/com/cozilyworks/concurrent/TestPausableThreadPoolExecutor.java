package com.cozilyworks.concurrent;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class TestPausableThreadPoolExecutor{
	public static void main(String[] arg){
		
	}
}

class PausableThreadPoolExecutor extends ThreadPoolExecutor{
	public PausableThreadPoolExecutor(int corePoolSize,int maximumPoolSize,long keepAliveTime,TimeUnit unit,BlockingQueue<Runnable> workQueue){
		super(corePoolSize,maximumPoolSize,keepAliveTime,unit,workQueue);
	}
	private boolean isPaused;
	private ReentrantLock pauseLock=new ReentrantLock();
	private Condition unpaused=pauseLock.newCondition();
	protected void beforeExecute(Thread t,Runnable r){
		super.beforeExecute(t,r);
		pauseLock.lock();
		try{
			while(isPaused)
				unpaused.await();
		}catch(InterruptedException ie){
			t.interrupt();
		}finally{
			pauseLock.unlock();
		}
	}
	public void pause(){
		pauseLock.lock();
		try{
			isPaused=true;
		}finally{
			pauseLock.unlock();
		}
	}
	public void resume(){
		pauseLock.lock();
		try{
			isPaused=false;
			unpaused.signalAll();
		}finally{
			pauseLock.unlock();
		}
	}
}
