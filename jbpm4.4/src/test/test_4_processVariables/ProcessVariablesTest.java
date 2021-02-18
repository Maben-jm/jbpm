package test.test_4_processVariables;

import com.maben.jbpm.pojo.Person;
import com.maben.jbpm.pojo.PersonOne;
import org.jbpm.api.*;
import org.junit.Test;

import java.io.InputStream;
import java.util.zip.ZipInputStream;

public class ProcessVariablesTest {

    //流程引擎
    private ProcessEngine processEngine = Configuration.getProcessEngine();

    /**部署流程定义*/
    @Test
    public void deployProcessDefinitionZip() {
        //使用类加载器
        InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("com/maben/jbpm/state/state.zip");
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        String deploymentID = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
                .createDeployment()//创建一个部署对象
                .addResourcesFromZipInputStream(zipInputStream)//从zip压缩文件部署（一次可部署多个文件）
                .deploy();//部署流程定义
        System.out.println("部署ID：" + deploymentID);
    }

    /**启动流程实例*/
    @Test
    public void startProcessInstance() {
        //流程定义的key
        String processDefinitionKey = "state";
        ProcessInstance pi = processEngine.getExecutionService()//与执行对象相关的Service
                .startProcessInstanceByKey(processDefinitionKey);//使用流程定义的key启动流程实例，当key值一致的情况下，默认启动最新版本的刘晨定义
        System.out.println("流程实例ID：" + pi.getId());
        System.out.println("流程定义的ID：" + pi.getProcessDefinitionId());
    }

    /**设置流程变量*/
    @Test
    public void setVariables() {
        //指定执行对象ID
        String executionId = "state.20001";
        ExecutionService executionService = processEngine.getExecutionService();//与执行相关的Service
        /**
         * 设置流程变量
         * 	* 参数一:执行ID
         *  * 参数二：流程变量的名称
         *  * 参数三：流程变量的值
         */
        executionService.setVariable(executionId, "请假", 3);//只能设置一个流程变量
        /**
         * 使用javabean的形式设置流程变量 :
         * 	一：实现serializable
         * */
        PersonOne personOne = new PersonOne(1L, "张三丰");
        executionService.setVariable(executionId, "人员信息", personOne);
        /**
         * 使用javabean的形式设置流程变量 :
         * 	二：使用数据库表
         * 	    这里手动将「张三丰h」插入到数据库表中
         * 	    insert into person values(1,'张三丰h');
         * */
        Person person = new Person(1L, "张三丰h");
        executionService.setVariable(executionId, "人员信息h", person);

        System.out.println("设置流程变量成功！");
    }

    /**获取流程变量*/
    @Test
    public void getVariables() {
        //指定执行对象ID
        String executionId = "state.20001";
        ExecutionService executionService = processEngine.getExecutionService();//与执行相关的Service
        /**
         * 获取流程变量
         *  * 参数一：执行ID
         *  * 参数二：流程变量的名称
         *  * 返回值：流程变量的值
         * */
        Integer value = (Integer) executionService.getVariable(executionId, "请假");
        System.out.println("*******************:" + value);
        /**
         * 使用javabean的形式获取流程变量:
         * 	一：实现serializable
         * */
        PersonOne personOne = (PersonOne) executionService.getVariable(executionId, "人员信息");
        System.out.println("*******************   " + personOne.getId() + "     " + personOne.getName());
        /**
         * 使用javabean的形式获取流程变量:
         * 	二：使用数据库表
         * */
        Person person = (Person) executionService.getVariable(executionId, "人员信息h");
        System.out.println("*******************   " + person.getId() + "     " + person.getName());
    }

    /**设置和获取流程变量的汇总*/
    @Test
    public void setAndGetVariable() {
        String executionId = "state.20001";
        ExecutionService executionService = processEngine.getExecutionService();//与执行相关的Service
        TaskService taskService = processEngine.getTaskService();//与任务相关的Service
        /**设置流程变量*/
        //指定执行ID，流程变量的名称，流程变量的值设置流程变量，一次只能设置一个值
        //		executionService.setVariable(executionId, name, value)
        //指定执行ID，Map<String,Object>集合（map集合的key表示流程变量的名称，map集合的value表示流程变量的值），设置多个流程变量
        //		executionService.setVariables(executionId, variables)
        //指定任务ID，Map<String,Object>集合（map集合的key表示流程变量的名称，map集合的value表示流程变量的值），设置多个流程变量
        //		taskService.setVariables(taskId, variables)
        //启动流程实例的同时，可以使用Map<String,Object>设置流程变量（map集合的key表示流程变量的名称，map集合的value表示流程变量的值）
        //		executionService.startProcessInstanceByKey(processDefinitionKey, variables)
        //完成任务的同时，可是使用Map<String,Object>设置流程变量（map集合的key表示流程变量的名称，map集合的value表示流程变量的值）
        //		taskService.completeTask(taskId, variables)

        /**获取流程变量*/
        //指定执行ID，流程变量的名称获取流程变量的值（一次只能获取一个值）
        //		executionService.getVariable(executionId, variableName)
        //指定执行对象ID，获取所有流程变量的名称，放置到Set<String>集合中
        executionService.getVariableNames(executionId);
        //指定执行对象ID，和流程变量的名称集合Set<String>，获取流程变量的值，值放置到Map<String,Object>（一次可获取多个值）
        //		executionService.getVariables(executionId, variableNames)
        //指定任务ID，流程变量的名称获取流程变量的值（一次只能获取一个值）
        //		taskService.getVariable(taskId, variableName)
        //指定任务ID，获取所有流程变量的名称，放置到Set<String>集合中
        //		taskService.getVariableNames(taskId)
        //指定任务ID，和流程变量的名称集合Set<String>，获取流程变量的值，值放置到Map<String,Object>（一次可获取多个值）
        //		taskService.getVariables(taskId, variableNames)

        System.out.println("/n");
    }
}
