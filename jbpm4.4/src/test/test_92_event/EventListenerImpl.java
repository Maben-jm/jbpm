package test.test_92_event;

import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;

@SuppressWarnings("serial")
public class EventListenerImpl implements EventListener {

	/**
	 * notify：监听类要执行的事件操作
	 */
	@Override
	public void notify(EventListenerExecution execution) throws Exception {
		System.out.println("执行监听："+execution.getActivity());

	}

}
