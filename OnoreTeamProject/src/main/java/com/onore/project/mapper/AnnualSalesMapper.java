package com.onore.project.mapper;

import java.util.List;

import com.onore.project.admin.vo.AnnualSalesVO;

public interface AnnualSalesMapper {

	List<AnnualSalesVO> getAnnualSales();
	AnnualSalesVO getAnnualSalesTotal();

}
