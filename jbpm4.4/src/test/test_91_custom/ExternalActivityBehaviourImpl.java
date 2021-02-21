package test.test_91_custom;

import java.util.Map;

import org.jbpm.api.activity.ActivityExecution;
import org.jbpm.api.activity.ExternalActivityBehaviour;

@SuppressWarnings("serial")
public class ExternalActivityBehaviourImpl implements ExternalActivityBehaviour {

	
	/**
	 * execute:定义该活动环节要执行的操作
	 *   * 当流程执行到自定义活动的时候，将会执行定义的execute()方法，但是流程不会停止下来，而是继续继续执行
	 *     此时signal()方法不会执行。
	 *   * signal()方法什么时候执行呢？
	 *      * 在execute()方法中要定义execution.waitForSignal();表示流程到达自定义活动时先停止下来
	 *      * 等待外部发出信号（向后执行一步）的时候，流程再继续执行，此时signal()方法会执行
	 * */
	@Override
	public void execute(ActivityExecution execution) throws Exception {
		//自定义活动以默认的连线离开
//		execution.takeDefaultTransition();
		//自定义活动以指定的连线离开
//		execution.take(transitionName)
		//强制终止流程
//		execution.end();
		//让流程执行到自定义活动时，会停止下来，等待外部发出信号（向后执行一步），才能继续执行
		execution.waitForSignal();
		System.out.println("执行自定义活动的execute()方法！");

	}
	
	/***
	 * signal:执行"向后执行一步"的操作，要执行的方法
	 */
	@Override
	public void signal(ActivityExecution execution, String signalName,
			Map<String, ?> parameters) throws Exception {
		System.out.println("执行自定义活动的signal()方法！");

	}

}
