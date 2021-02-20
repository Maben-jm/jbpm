package test.test_8_task2;

import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Task;
import org.junit.Test;

public class TaskTest {

    //流程引擎对象
    ProcessEngine processEngine = Configuration.getProcessEngine();

    /**
     * 指定个人任务的办理人
     *   方法三：使用类的方式指定个人任务的办理人
     *       （1）在test.jpdl.xml中，选中type为null
     *       （2）建立类AssignmentHandleImpl实现AssignmentHandle接口
     *           在方法中定义：
     *              String userId = "王五";
     *              assignable.setAssignee(userId);
     *       （3）在test.jpdl.xml中<task></task>中
     *          <assignment-handler class="cn.itcast.h_task02.AssignmentHandlerImpl"></assignment-handler>
     * */
    @Test
    public void deployProcessDefinitionAndStartProcessInstance() {
        URL url = this.getClass().getResource("test.jpdl.xml");//要求与当前类放置到同一个目录下
        //部署流程定义
        String deploymentId = processEngine.getRepositoryService()//
                .createDeployment()//
                .addResourceFromUrl(url)//从URL中部署一个对象（Xxx.jpdl.xml）
                .deploy();
        System.out.println("部署对象ID：" + deploymentId);
        //启动流程实例
        ProcessInstance pi = processEngine.getExecutionService()//
                .startProcessInstanceByKey("test");//按照最新版本的流程定义的key启动
        System.out.println("流程实例ID：" + pi.getId());
    }

    /**查询个人任务*/
    @Test
    public void findMyPersonalTask() {
        List<Task> list = processEngine.getTaskService()//
                .createTaskQuery()//
                .assignee("赵六")//指定个人任务的办理人
                .list();
        if (list != null && list.size() > 0) {
            for (Task task : list) {
                System.out.println("任务ID：" + task.getId());
                System.out.println("任务名称：" + task.getName());
                System.out.println("任务办理人：" + task.getAssignee());
                System.out.println("任务创建时间：" + task.getCreateTime());
                System.out.println("执行对象ID：" + task.getExecutionId());
            }
        }
    }

    /**个人任务从一个办理人指定另一个办理人*/
    @Test
    public void assignTask() {
        String taskId = "340008";//任务ID
        String userId = "赵六";//办理人
        processEngine.getTaskService()//
                .assignTask(taskId, userId);
    }

}
