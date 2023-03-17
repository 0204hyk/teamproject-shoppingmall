package com.onore.project.mapper;

import java.util.List;

import com.onore.project.admin.vo.MonthlySalesVO;

public interface MonthlySalesMapper {
	
	List<MonthlySalesVO> getMonthlySales();
	MonthlySalesVO getMonthlySalesTotal();
	
}
