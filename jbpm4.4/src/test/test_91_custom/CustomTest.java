package test.test_91_custom;

import java.net.URL;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.junit.Test;

public class CustomTest {

	//流程引擎对象
	ProcessEngine processEngine = Configuration.getProcessEngine();
	
	/**部署流程定义+启动流程实例*/
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
	
	/**向后执行一步*/
	@Test
	public void signalExecution(){
		//执行ID
		String executionId = "test.400007";
		processEngine.getExecutionService()//
					.signalExecutionById(executionId);
		System.out.println("执行向后执行一步");
	}
}
