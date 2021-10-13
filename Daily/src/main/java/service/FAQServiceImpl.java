package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.FAQDAO;
import vo.FAQVO;

@Service
public class FAQServiceImpl implements FAQService {
	
	@Autowired
	public FAQDAO dao ;
	
	@Override
	public List<FAQVO> selectList() {
		return dao.selectList();
	}

	@Override
	public FAQVO selectOne(FAQVO fvo) {
		return dao.selectOne(fvo);
	}

	@Override
	public int insert(FAQVO fvo) {
		return dao.insert(fvo);
	}

	@Override
	public int update(FAQVO fvo) {
		return dao.update(fvo);
	}

	@Override
	public int delete(FAQVO fvo) {
		return dao.delete(fvo);
	}
}
