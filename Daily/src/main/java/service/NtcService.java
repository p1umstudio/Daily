package service;

import java.util.List;

import vo.NtcVO;

public interface NtcService {
	List<NtcVO> selectList();
	NtcVO selectOne(NtcVO nvo);
	int insert(NtcVO nvo);
	int update(NtcVO nvo);
	int delete(NtcVO nvo);
}
