package com.ingkoo.farm.service;

import com.ingkoo.farm.model.ActiveApply;
import com.jfinal.plugin.activerecord.Page;
import org.apache.commons.lang3.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * 激活
 *
 * @author lichen
 */
public class ActiveService {

	public Page<ActiveApply> queryActivatedApplyList(String userId, String status, String activeNo, int pageNumber,
	                                                int pageSize) {
		List<Object> paramList = new ArrayList<>();
		StringBuilder sqlBuilder = new StringBuilder("from active_apply where activatedNo = ? ");
		paramList.add(activeNo);

		if (StringUtils.isNotEmpty(userId)) {
			sqlBuilder.append("and userId = ? ");
			paramList.add(userId);
		}
		if (StringUtils.isNotEmpty(status)) {
			sqlBuilder.append("and status = ? ");
			paramList.add(status);
		}

		sqlBuilder.append("order by status asc,applyTime desc");

		return ActiveApply.dao.paginate(pageNumber, pageSize, "select *", sqlBuilder.toString(), paramList.toArray());
	}
}
