package test.test_10_groupTask2;

import org.jbpm.api.model.OpenExecution;
import org.jbpm.api.task.Assignable;
import org.jbpm.api.task.AssignmentHandler;

@SuppressWarnings("serial")
public class AssignmentHandlerImpl implements AssignmentHandler {

	/**
	 * Assignable:指定任务办理人
	 * OpenExecution：执行对象
	 */
	@Override
	public void assign(Assignable assignable, OpenExecution execution)
			throws Exception {
//		assignable.setAssignee(userId)//指定个人任务办理人
		String userId1 = "张三丰";
		String userId2 = "张翠山";
		assignable.addCandidateUser(userId1);//指定组任务的办理人
		assignable.addCandidateUser(userId2);//指定组任务的办理人
	}

}
