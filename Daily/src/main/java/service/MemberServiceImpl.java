package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.MemberDAO;
import vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO dao;
	
	@Override
	public int changeinfo(MemberVO vo) {
		return dao.mchangeinfo(vo);
	}
	
	@Override
	public int changepw(MemberVO vo) {
		return dao.mchangepw(vo);
	}
	@Override
	public MemberVO mfindid(MemberVO vo) {
		return dao.mfindid(vo);
	}
	@Override
	public MemberVO mfindpw(MemberVO vo) {
		return dao.mfindpw(vo);
	}

	@Override
	public List<MemberVO> mselectList() {
		// TODO 회원 리스트
		return dao.mselectList();
	}
	@Override
	public MemberVO mselectOne(MemberVO vo) {
		// TODO 회원 한명 
		return dao.mselectOne(vo);
	}
	@Override
	public MemberVO mselectOne2(MemberVO vo) {
		// TODO 회원 한명 
		return dao.mselectOne(vo);
	}
	@Override
	public int minsert(MemberVO vo) {
		// TODO 추가
		return dao.minsert(vo);
	}
	@Override
	public int mupdate(MemberVO vo) {
		// TODO 수정
		return dao.mupdate(vo);
	}
	@Override
	public int mdelete(MemberVO vo) {
		// TODO 삭제
		return dao.mdelete(vo);
	}
}
