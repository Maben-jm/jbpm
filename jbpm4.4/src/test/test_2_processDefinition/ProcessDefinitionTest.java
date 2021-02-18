package test.test_2_processDefinition;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

import org.jbpm.api.Configuration;
import org.jbpm.api.ProcessDefinition;
import org.jbpm.api.ProcessDefinitionQuery;
import org.jbpm.api.ProcessEngine;
import org.junit.Test;

public class ProcessDefinitionTest {

	/**创建流程引擎的三种方式*/
	public void createProcessEngine(){
		/**
		 * 第一种，指定路径加载jbpm.cfg.xml文件创建流程引擎对象
		 *       如果jbpm.cfg.xml文件没有放置到类路径下，此时添加包名：例如cn/itcast/jbpm.cfg.xml
		 *       表示该文件放置到cn.itcast包下
		 */
//		new Configuration().setResource("jbpm.cfg.xml").buildProcessEngine();
		/**
		 * 第二种：此时要求文件一定要命名成jbpm.cfg.xml，而且放置到类路径下才可以使用
		 */
//		new Configuration().buildProcessEngine();
		/**
		 * 第三种：使用如下代码获取使用默认配置文件的、单例的ProcessEngine对象：
		 *      !!!!经常使用!!!!，因为流程引擎在项目开发的过程中只创建一次就可以了
		 */
//		Configuration.getProcessEngine();
	}
	
	//创建流程引擎对象
	private ProcessEngine processEngine = Configuration.getProcessEngine();
	
	/**部署流程定义(从类路径下部署)*/
	@Test
	public void deployProcessDefinition(){
		String deploymentID = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
							.createDeployment()//创建一个部署对象
							.addResourceFromClasspath("com/maben/jbpm/helloworld/helloworld.jpdl.xml")//从类路径下部署文件（一次只能部署一个文件）
							.addResourceFromClasspath("com/maben/jbpm/helloworld/helloworld.png")//
							.deploy();//部署流程定义
		System.out.println("部署ID："+deploymentID);
	}
	
	/**部署流程定义(从zip文件)*/
	@Test
	public void deployProcessDefinitionZip(){
		//使用类加载器
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("helloworld/helloworld.zip");
		ZipInputStream zipInputStream = new ZipInputStream(inputStream);
		String deploymentID = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
							.createDeployment()//创建一个部署对象
							.addResourcesFromZipInputStream(zipInputStream)//从zip压缩文件部署（一次可部署多个文件）
							.deploy();//部署流程定义
		System.out.println("部署ID："+deploymentID);
	}
	
	/**查询流程定义*/
	@Test
	public void findProcessDefinition(){
		String key = "helloworld";
		List<ProcessDefinition> list = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
									.createProcessDefinitionQuery()//创建流程定义的查询对象
			//						.deploymentId(deploymentId)//按照部署对象ID进行查询
			//						.processDefinitionId(processDefinitionId)//按照流程定义的ID进行查询
									.processDefinitionKey(key)//按照流程定义的key查询
			//						.processDefinitionName(name)//按照流程定义的名称查询
									
			//						.orderAsc(ProcessDefinitionQuery.PROPERTY_VERSION);//按照流程定义的版本升序排列
			//						.orderDesc(ProcessDefinitionQuery.PROPERTY_DEPLOYMENT_TIMESTAMP);//按照部署的时间降序排列
									
			//						.count()//返回结果集的数量
			//						.uniqueResult()//返回唯一的结果集对象
									.list();//返回一个列表集合
			//						.page(firstResult, maxResults)//支持分页，传递firstResult：当前页从第几条开始检索。maxResults：当前页最多显示多少记录
		if(list!=null && list.size()>0){
			for(ProcessDefinition pd:list){
				System.out.println("流程定义ID:"+pd.getId());//表示流程定义的key+"-"+流程定义的版本
				System.out.println("流程定义名称:"+pd.getName());//表示helloworld.jpdl.xml文件中name的属性值
				System.out.println("流程定义的key:"+pd.getKey());//表示helloworld.jpdl.xml文件中key的属性值，如果key值，默认是name的属性值
				System.out.println("流程定义的版本号:"+pd.getVersion());//表示流程定义的版本，如果key值相同，部署的时候版本号要加1，初始值是1
				System.out.println("资源文件名称:"+pd.getImageResourceName());//表示图片文件的名称和路径
				System.out.println("部署对象ID:"+pd.getDeploymentId());
				System.out.println("------------------------------------");
			}
		}
	}
	
	/**查看流程图
	 * @throws Exception */
	@Test
	public void findProcessImpage() throws Exception{
		String deploymentId = "40001";
		String resourceName = "helloworld/helloworld.png";
		//从数据库中查询图片资源，并将图片用输出流的形式，输出到D的盘的根目录下
		InputStream in = processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
						.getResourceAsStream(deploymentId, resourceName);//使用部署对象ID和资源文件名称读到输入流中
		//将输入流的数据读出，写到输出流中，将文件输出到D盘上
		FileOutputStream out = new FileOutputStream(new File("D://process.png"));
		for(int b=-1;(b=in.read())!=-1;){
			out.write(b);
		}
		out.close();
		in.close();
	}
	
	/**删除流程定义*/
	@Test
	public void deleteProcessDefinition(){
		//部署对象ID
		String deploymentId = "50001";
		/**
		 * 不带级联的删除：
		 *    * 只能删除没有启动实例的流程，如果流程已经启动，此时不能删除，会报异常
		 */
//		processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
//						.deleteDeployment(deploymentId);//按照部署对象ID删除流程定义
		
		/**
		 * 带级联的删除
		 * 	  * 不管流程是否在执行（包括没有执行和正在执行），都能进行删除
		 *    * 项目一般使用带级联删除
		 */
		processEngine.getRepositoryService()//与部署对象和流程定义相关的Service
						.deleteDeploymentCascade(deploymentId);//按照部署对象ID删除流程定义
	}
	
	/**查询所有最新版本的流程定义*/
	@Test
	public void findProcessDefinitionByLastVersion(){
		//查询流程定义，按照流程定义的版本升序排列（最高版本的在后面）
		List<ProcessDefinition> list = processEngine.getRepositoryService()//
									.createProcessDefinitionQuery()//创建流程定义查询对象
									.orderAsc(ProcessDefinitionQuery.PROPERTY_VERSION)//按照流程定义的版本升序排列
									.list();
		/**
		 * 使用Map集合（特点：当key值一致的情况，后一次版本的值将替换前一次版本的值）
			   * map集合的key：流程定义的key
			   * map集合的value：流程定义的对象
		 */
		Map<String, ProcessDefinition> map = new HashMap<String, ProcessDefinition>();
		if(list!=null && list.size()>0){
			for(ProcessDefinition pd:list){
				map.put(pd.getKey(), pd);//当key值一样的情况下，后一次版本的值要替换前一次版本的值
			}
		}
		//获取最新的版本流程定义的集合
		List<ProcessDefinition> pdList = new ArrayList<ProcessDefinition>(map.values());
		if(pdList!=null && pdList.size()>0){
			for(ProcessDefinition pd:pdList){
				System.out.println("流程定义ID:"+pd.getId());//表示流程定义的key+"-"+流程定义的版本
				System.out.println("流程定义名称:"+pd.getName());//表示helloworld.jpdl.xml文件中name的属性值
				System.out.println("流程定义的key:"+pd.getKey());//表示helloworld.jpdl.xml文件中key的属性值，如果key值，默认是name的属性值
				System.out.println("流程定义的版本号:"+pd.getVersion());//表示流程定义的版本，如果key值相同，部署的时候版本号要加1，初始值是1
				System.out.println("资源文件名称:"+pd.getImageResourceName());//表示图片文件的名称和路径
				System.out.println("部署对象ID:"+pd.getDeploymentId());
				System.out.println("------------------------------------");
			}
		}
		
	}
	
	/**使用流程定义的key删除所有版本的流程定义*/
	@Test
	public void deleteProcessDefinitionByKey(){
		//流程定义的key
		String key = "helloworld";
		//使用流程定义key查询流程定义，获取所有该key值下集合
		List<ProcessDefinition> list = processEngine.getRepositoryService()//
									.createProcessDefinitionQuery()//
									.processDefinitionKey(key)//按照流程定义的key进行查询
									.list();
		//遍历获取每个部署ID，执行删除的操作
		if(list!=null && list.size()>0){
			for(ProcessDefinition pd:list){
				//获取部署对象ID
				String deploymentId = pd.getDeploymentId();
				//执行删除
				processEngine.getRepositoryService()//
								.deleteDeploymentCascade(deploymentId);
			}
		}
	}
}
