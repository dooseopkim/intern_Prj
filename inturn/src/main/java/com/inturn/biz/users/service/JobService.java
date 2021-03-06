package com.inturn.biz.users.service;

import java.util.List;

import com.inturn.biz.users.vo.JobVO;

public interface JobService {
	public List<JobVO> getUserJob(String id);

	public int insertJob(JobVO vo);

	public int modifyJob(JobVO vo);

	public int deleteJob(int job_num);

	public JobVO getJob(int job_num);
}
