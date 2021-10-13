package service;

import java.util.List;

import vo.FAQVO;

public interface FAQService {
	List<FAQVO> selectList();
	FAQVO selectOne(FAQVO fvo);
	int insert(FAQVO fvo);
	int update(FAQVO fvo);
	int delete(FAQVO fvo);
}
