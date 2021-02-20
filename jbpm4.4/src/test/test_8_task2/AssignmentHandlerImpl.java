package test.test_8_task2;

import org.jbpm.api.model.OpenExecution;
import org.jbpm.api.task.Assignable;
import org.jbpm.api.task.AssignmentHandler;

@SuppressWarnings("serial")
public class AssignmentHandlerImpl implements AssignmentHandler {

	/**
	 * Assignable:用来指定办理人
	 * OpenExecution：执行对象
	 */
	@Override
	public void assign(Assignable assignable, OpenExecution execution)
			throws Exception {
		//指定个人任务的办理人
		String userId = "王五";
		assignable.setAssignee(userId);
	}

}
