package com.green.common.duty.vo;

public class CommonDutyVo {

	private int common_duty_idx;
	private String common_duty_name;

	public CommonDutyVo() {
	}

	public CommonDutyVo(int common_duty_idx, String common_duty_name) {
		super();
		this.common_duty_idx = common_duty_idx;
		this.common_duty_name = common_duty_name;
	}

	public int getCommon_duty_idx() {
		return common_duty_idx;
	}

	public void setCommon_duty_idx(int common_duty_idx) {
		this.common_duty_idx = common_duty_idx;
	}

	public String getCommon_duty_name() {
		return common_duty_name;
	}

	public void setCommon_duty_name(String common_duty_name) {
		this.common_duty_name = common_duty_name;
	}

	@Override
	public String toString() {
		return "CommonDutyVo [common_duty_idx=" + common_duty_idx + ", common_duty_name=" + common_duty_name + "]";
	}

}
