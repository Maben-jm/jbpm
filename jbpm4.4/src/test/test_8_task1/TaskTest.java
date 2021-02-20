package test.test_8_task1;

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
     *   方法一：在test.jpdl.xml中，选择assignee，指定办理人
     *   方法二：使用流程变量的形式动态指定办理人
     *       （1）：在test.jpdl.xml中，选择assignee，设置值为#{userID}
     *       （2）：流程变量定义指定的办理人，
     *              Map<String, Object> variables = new HashMap<String, Object>();
     *               variables.put("userID", "李四");
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
        //使用流程变量，设置任务的办理人
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("userID", "李四");
        //启动流程实例，同时设置流程变量
        ProcessInstance pi = processEngine.getExecutionService()//
                .startProcessInstanceByKey("test", variables);//按照最新版本的流程定义的key启动
        System.out.println("流程实例ID：" + pi.getId());
    }

    /**查询个人任务*/
    @Test
    public void findMyPersonalTask() {
        List<Task> list = processEngine.getTaskService()//
                .createTaskQuery()//
                .assignee("李四")//指定个人任务的办理人
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

}
