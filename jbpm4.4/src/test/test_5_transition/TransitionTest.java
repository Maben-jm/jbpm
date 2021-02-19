package test.test_5_transition;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Task;
import org.junit.Test;

import java.net.URL;

/**
 * 连接线相关API
 */
public class TransitionTest {

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
		//启动流程实例
		ProcessInstance pi = processEngine.getExecutionService()//
							.startProcessInstanceByKey("test");//按照最新版本的流程定义的key启动
		System.out.println("流程实例ID："+pi.getId());
		//查看我的个人任务
		Task task = processEngine.getTaskService()//
							.createTaskQuery()//
							.assignee("李四")//按照办理人查询
							.processInstanceId(pi.getId())//按照流程实例ID进行查询
							.uniqueResult();
		if(task!=null){
			System.out.println("任务ID："+task.getId());
			System.out.println("任务名称："+task.getName());
			System.out.println("任务办理人："+task.getAssignee());
			System.out.println("任务创建时间："+task.getCreateTime());
			System.out.println("执行对象ID："+task.getExecutionId());
		}
	}
	
	/**办理我的个人任务*/
	@Test
	public void completeMyPersonalTask(){
		String taskId = "140008";//任务ID
		String outcome ="to end1"; //连线名称
		processEngine.getTaskService()//
						.completeTask(taskId,outcome);//指定任务ID和连线名称完成当前任务
		System.out.println("完成我的个人任务："+taskId);
	}
}
