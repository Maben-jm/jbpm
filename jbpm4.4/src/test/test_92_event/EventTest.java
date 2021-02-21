package test.test_92_event;

import java.net.URL;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.junit.Test;

public class EventTest {

	//流程引擎对象
	ProcessEngine processEngine = Configuration.getProcessEngine();
	
	/**部署流程定义+启动流程实例*/
	/**
	 * 部署流程定义+启动流程实例:
	 * 
	 *   * 执行监听：activity(start1)     ---表示流程开始的时候要执行的监听操作
		 * 执行监听：activity(start1)     ---表示离开开始活动的时候要执行的监听操作
		 * 执行监听：activity(发送短信)    ---当流程进入到任务节点的时候要执行的监听操作
		 * 
	       完成当前任务：
	     * 执行监听：activity(发送短信)  ---当流程离开任务节点的时候要执行的监听操作
	     * 执行监听：activity(end1)	   ---表示进入结束活动的时候要执行的监听操作
	     * 执行监听：activity(end1)    ---表示流程结束的时候要执行的监听操作
 	 */
	@Test
	public void deployProcessDefinitionAndStartProcessInstance(){
		URL url = this.getClass().getResource("test.jpdl.xml");//要求与当前类放置到同一个目录下
		//部署流程定义
		String deploymentId = processEngine.getRepositoryService()//
								.createDeployment()//
								.addResourceFromUrl(url)//从URL中部署一个对象（Xxx.jpdl.xml）
								.deploy();
		System.out.println("部署对象ID："+deploymentId);
		//启动流程实例，同时设置流程变量
		ProcessInstance pi = processEngine.getExecutionService()//
							.startProcessInstanceByKey("test");//按照最新版本的流程定义的key启动
		System.out.println("流程实例ID："+pi.getId());
	}
	
	/**完成当前任务*/
	@Test
	public void completeTask(){
		String taskId = "410008";//任务ID
		processEngine.getTaskService()//
					.completeTask(taskId);
	}
}
