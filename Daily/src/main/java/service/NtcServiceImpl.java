package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.NtcDAO;
import vo.NtcVO;

@Service
public class NtcServiceImpl implements NtcService {

	@Autowired
	public NtcDAO dao;

	@Override
	public List<NtcVO> selectList() {
		return dao.selectList();
	}
	@Override
	public NtcVO selectOne(NtcVO nvo) {
		return dao.selectOne(nvo);
	}

	@Override
	public int insert(NtcVO nvo) {
		return dao.insert(nvo);
	}

	@Override
	public int update(NtcVO nvo) {
		return dao.update(nvo);
	}

	@Override
	public int delete(NtcVO nvo) {
		return dao.delete(nvo);
	}
}
