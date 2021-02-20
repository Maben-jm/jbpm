package test.test_10_groupTask2;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Participation;
import org.jbpm.api.task.Task;
import org.junit.Test;

public class TaskTest {

	//流程引擎对象
	ProcessEngine processEngine = Configuration.getProcessEngine();

	/**
	 * 指定组任务的办理人
	 *   方法三：使用类的方式指定组任务的办理人
	 *   	（1）在test.jpdl.xml中，选择type类型为null
	 *      （2）使用AssignmentHandlerImpl类实现ssignmentHandler接口
	 *           在方法中定义：
	 *              String userId1 = "张三丰";
	 *				String userId2 = "张翠山";
	 *				assignable.addCandidateUser(userId1);//指定组任务的办理人
	 *				assignable.addCandidateUser(userId2);//指定组任务的办理人、
     *		（3）在test.jpdl.xml中，<task></task>中指定类
	 *				<assignment-handler class="cn.itcast.i_groupTask02.AssignmentHandlerImpl"></assignment-handler>
	 *
	 * */
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
	
	/**查询组任务*/
	@Test
	public void findMyGroupTask(){
		List<Task> list = processEngine.getTaskService()//
						.createTaskQuery()//
						.candidate("周芷若")//指定组任务的办理人
						.list();
		if(list!=null && list.size()>0){
			for(Task task:list){
				System.out.println("任务ID："+task.getId());
				System.out.println("任务名称："+task.getName());
				System.out.println("任务办理人："+task.getAssignee());
				System.out.println("任务创建时间："+task.getCreateTime());
				System.out.println("执行对象ID："+task.getExecutionId());
			}
		}
	}
	
	/**将组任务转换成个人任务*/
	@Test
	public void takeTask(){
		String taskId = "370008";//任务ID
		String userId = "灭绝师太";//指定个人任务的办理人
		processEngine.getTaskService()//
					.takeTask(taskId, userId);
	}


	/**查询个人任务*/
	@Test
	public void findMyPersonalTask(){
		List<Task> list = processEngine.getTaskService()//
				.createTaskQuery()//
				.assignee("灭绝师太")//指定组任务的办理人
				.list();
		if(list!=null && list.size()>0){
			for(Task task:list){
				System.out.println("任务ID："+task.getId());
				System.out.println("任务名称："+task.getName());
				System.out.println("任务办理人："+task.getAssignee());
				System.out.println("任务创建时间："+task.getCreateTime());
				System.out.println("执行对象ID："+task.getExecutionId());
			}
		}
	}
	
	/**将个人任务再回退到组任务（前提之前该任务是组任务）*/
	@Test
	public void assignTask(){
		String taskId = "370008";//任务ID
		processEngine.getTaskService()//
					.assignTask(taskId, null);
	}
	
	/**向组任务中添加成员*/
	@Test
	public void addGroupUser(){
		String taskId = "370008";//任务ID
		String userId = "周芷若";//组任务的成员
		processEngine.getTaskService()//
					.addTaskParticipatingUser(taskId, userId, Participation.CANDIDATE);
	}
	
	/**向组任务中删除成员*/
	@Test
	public void removeGroupUser(){
		String taskId = "370008";//任务ID
		String userId = "周芷若";//组任务的成员
		processEngine.getTaskService()//
					.removeTaskParticipatingUser(taskId, userId, Participation.CANDIDATE);
	}
	

}
