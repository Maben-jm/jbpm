package test.test_6_desiction;

/**
 * decision 学习
 * @author maben
 *
 */

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Task;
import org.junit.Test;

public class DecisionTest {

	/**
	 * 首先获取流程对象
	 */
	private ProcessEngine processEngine = Configuration.getProcessEngine();

	/**
	 * 部署定义+启动实例
	 */
	@Test
	public void deployProcessDefinitionAndStartProcessInstance() {
		URL url = this.getClass().getResource("desicion.jpdl.xml");
//		部署流程定义
		String deploymentId = processEngine.getRepositoryService().createDeployment().addResourceFromUrl(url).deploy();
		System.out.println("部署对象:"+deploymentId);
		/**如果报销金额超过1000元，此时要让总经理审核，如果在1000元以下，此时可以直接结束，由部门经理审核即可*/
		Map<String, Object> variables = new HashMap<String, Object>();
		variables.put("报销金额", 3000);
		//启动流程实例的同时，设置流程变量
		ProcessInstance pi = processEngine.getExecutionService()//
							.startProcessInstanceByKey("test",variables);//按照最新版本的流程定义的key启动
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
		String taskId = "290009";//任务ID
		processEngine.getTaskService()//
						.completeTask(taskId);//指定任务ID和连线名称完成当前任务
		System.out.println("完成我的个人任务："+taskId);
	}
}
