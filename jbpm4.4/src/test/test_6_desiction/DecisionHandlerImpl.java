package test.test_6_desiction;

import org.jbpm.api.jpdl.DecisionHandler;
import org.jbpm.api.model.OpenExecution;

@SuppressWarnings("serial")
public class DecisionHandlerImpl implements DecisionHandler {

	@Override
	public String decide(OpenExecution execution) {
		// 获取流程变量
		Integer value = (Integer) execution.getVariable("报销金额");
		// 此时需要总经理审核
		if (value != null && value >= 1000) {
			return "to 审批【总经理】";
		}
		return "to end1";
	}

}
