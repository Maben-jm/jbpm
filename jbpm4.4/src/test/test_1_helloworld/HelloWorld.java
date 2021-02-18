package test.test_1_helloworld;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessEngine;
import org.jbpm.api.ProcessInstance;
import org.jbpm.api.task.Task;
import org.junit.Test;

import java.util.List;

public class HelloWorld {

    @Test
    public void createTable(){
        new org.hibernate.cfg.Configuration().configure("jbpm.hibernate.cfg.xml").buildSessionFactory();
    }

    //创建流程引擎：
    ProcessEngine processEngine = new Configuration().setResource("jbpm.cfg.xml").buildProcessEngine();

    /**部署流程定义*/
    @Test
    public void deployProcessDefinition(){
        String DeploymentID = processEngine.getRepositoryService()//与部署对象和流程定义相关的Serivce
                .createDeployment()//创建一个部署对象
                .addResourceFromClasspath("com/maben/jbpm/helloworld/helloworld.xml")//从类路径下加载资源（一次只能加载一个文件）
                .addResourceFromClasspath("com/maben/jbpm/helloworld/helloworld.png")//从类路径下加载资源（一次只能加载一个文件）
                .deploy();//部署流程定义
        System.out.println("部署对象ID："+DeploymentID);
    }

    /**启动流程实例*/
    @Test
    public void startProcessInstance(){
        String processDefinitionKey = "helloworld";//流程定义的key
        ProcessInstance pi = processEngine.getExecutionService()//管理执行的，包括启动、推进、删除Execution等操作
                .startProcessInstanceByKey(processDefinitionKey);//按照流程定义的key来启动流程实例，默认按照最新版本的流程定义启动
        System.out.println("流程实例ID："+pi.getId());
        System.out.println("流程定义ID："+pi.getProcessDefinitionId());
    }

    /**查看我的个人任务列表*/
    @Test
    public void findMyPersonalTaskList(){
        String userId = "总经理";
        List<Task> list = processEngine.getTaskService()//管理任务的Service
                .findPersonalTasks(userId);
        if(list!=null && list.size()>0){
            for(Task task:list){
                System.out.println("任务ID:"+task.getId());
                System.out.println("任务名称:"+task.getName());
                System.out.println("任务办理人:"+task.getAssignee());
                System.out.println("任务的创建时间:"+task.getCreateTime());
                System.out.println("任务执行ID:"+task.getExecutionId());
            }
        }
    }

    /**完成我的个人任务*/
    @Test
    public void completeMyPersonalTask(){
        String taskId = "40001";//指定任务ID
        processEngine.getTaskService()//管理任务的Service
                .completeTask(taskId);
        System.out.println("完成任务："+taskId);
    }

}
