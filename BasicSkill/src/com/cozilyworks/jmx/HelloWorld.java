package com.cozilyworks.jmx;

import javax.management.Notification;
import javax.management.NotificationBroadcasterSupport;

public class HelloWorld extends NotificationBroadcasterSupport implements HelloWorldMBean{
	public static String greeting=null;
	public HelloWorld(){
		super();
		this.greeting="default value";
	}
	public HelloWorld(String greeting){
		this.greeting=greeting;
	}
	public void printGreeting(){
		System.out.println(greeting);
	}
	public String getGreeting(){
		return greeting;
	}
	public void setGreeting(String greeting){
		this.greeting=greeting;
		Notification notification=new Notification("jmxbook.ch2.helloWorld.test",this,-1,System.currentTimeMillis(),greeting);
		sendNotification(notification);
	}
}
