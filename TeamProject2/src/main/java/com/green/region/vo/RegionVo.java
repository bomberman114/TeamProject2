package com.green.region.vo;

public class RegionVo {
	private int region_idx;      // 지역 번호
	private String region_name;  // 지역 이름

	public RegionVo( ) {}

	@Override
	public String toString() {
		return "RegionVo [region_idx=" + region_idx + ", region_name=" + region_name + "]";
	}

	public int getRegion_idx() {
		return region_idx;
	}

	public void setRegion_idx(int region_idx) {
		this.region_idx = region_idx;
	}

	public String getRegion_name() {
		return region_name;
	}

	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}

	public RegionVo(int region_idx, String region_name) {
		super();
		this.region_idx = region_idx;
		this.region_name = region_name;
	}
	
	
}
