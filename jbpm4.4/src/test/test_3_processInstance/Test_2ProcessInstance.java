package test.test_3_processInstance;

import java.io.InputStream;
import java.util.List;
import java.util.zip.ZipInputStream;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Task;
import org.junit.Test;

/**
 * 流程实例002
 */
public class Test_2ProcessInstance {
	
	//创建流程引擎对象
	ProcessEngine processEngine = Configuration.getProcessEngine();

	/**部署流程定义*/
	@Test
	public void deployProcessDefinitionZip(){
		//使用类加载器
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("com/maben/jbpm/helloworld/helloworld.zip");
		ZipInputStream zipInputStream = new ZipInputStream(inputStream);
		String deploymentID = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
							.createDeployment()//创建一个部署对象
							.addResourcesFromZipInputStream(zipInputStream)//从zip压缩文件部署（一次可部署多个文件）
							.deploy();//部署流程定义
		System.out.println("部署ID："+deploymentID);
	}
	
	/**启动流程实例*/
	@Test
	public void startProcessInstance(){
		//流程定义的key
		String processDefinitionKey = "helloworld";
		ProcessInstance pi = processEngine.getExecutionService()//与执行对象相关的Service
								.startProcessInstanceByKey(processDefinitionKey);//使用流程定义的key启动流程实例，当key值一致的情况下，默认启动最新版本的刘晨定义
		System.out.println("流程实例ID："+pi.getId());
		System.out.println("流程定义的ID："+pi.getProcessDefinitionId());
	}
	
	/**查看我的个人任务列表*/
	@Test
	public void findMyPersonalTaskList(){
		//指定办理人
		String userId = "总经理";
//		List<Task> list = processEngine.getTaskService()//与任务相关的Service
//						.findPersonalTasks(userId);
		List<Task> list = processEngine.getTaskService()//与任务相关的Service
						.createTaskQuery()//创建任务查询对象
						.assignee(userId)//指定个人任务办理人
//						.candidate(userId)//指定组任务的办理人
//						.activityName(activityName)//按照活动名称进行查询
//						.executionId(executionId)//按照执行ID进行查询
//						.processDefinitionId(processDefinitionId)//按照流程定义的ID进行查询
//						.processInstanceId(processInstanceId)//按照流程实例ID进行查询
						
//						.orderAsc(TaskQuery.PROPERTY_ASSIGNEE)//按照办理人升序排列
//						.orderDesc(TaskQuery.PROPERTY_CREATEDATE)//按照任务的创建时间降序排列
						
//						.count()//返回结果集数量
//						.uniqueResult()//返回唯一结果集
//						.page(firstResult, maxResults)//支持分页查询
						.list();//返回结果集列表
						
		if(list!=null && list.size()>0){
			for(Task task:list){
				System.out.println("任务ID:"+task.getId());
				System.out.println("任务名称:"+task.getName());
				System.out.println("任务办理人:"+task.getAssignee());
				System.out.println("任务的创建时间:"+task.getCreateTime());
				System.out.println("任务执行ID:"+task.getExecutionId());
				System.out.println("******************************************");
			}
		}
	}
	
	/**完成我的个人任务*/
	@Test
	public void completeMyPersonalTask(){
		String taskId = "120001";
		processEngine.getTaskService()//
						.completeTask(taskId);//指定任务ID完成个人任务
		
		//注意：如果是顺序执行任务的时候，此时不需要指定连线的名称
//		processEngine.getTaskService()//
//						.completeTask(taskId, "to 审批【部门经理】");//表示指定任务ID和连线的名称完成任务
		System.out.println("完成个人任务！");
	}
	
	/**先后执行一步*/
	@Test
	public void singleExecution(){
		//指定执行ID
		String executionId = "state.170001";
		/**注意：如果流程中活动环节只有1个，不需要指定连线的名称完成*/
		ProcessInstance pi = processEngine.getExecutionService()//与执行相关的Service
								.signalExecutionById(executionId);//指定执行的ID向后执行一步
		/**注意：如果流程中活动环节超过2个以上，要指定连线的名称完成任务*/
//		ProcessInstance pi = processEngine.getExecutionService()//与执行相关的Service
//								.signalExecutionById(executionId,"to end1");//指定执行的ID和连线的名称向后执行一步
		System.out.println("流程实例ID："+pi.getId());
	}
}
