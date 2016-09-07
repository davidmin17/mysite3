package kr.co.saramin.mysite.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.saramin.mysite.dao.GuestbookDao;
import kr.co.saramin.mysite.vo.GuestbookVo;

@Service
public class GuestbookService {
	@Autowired
	private GuestbookDao guestbookDao;
	
	public List<GuestbookVo> getList() {
		//GuestbookVo vo = guestbookDao.get(1L);
		//System.out.println(vo);
		
		return guestbookDao.getList();
	}
	
	public void write(GuestbookVo guestbookVo) {
		guestbookDao.insert(guestbookVo);
	}
	
	public void delete(GuestbookVo guestbookVo) {
		guestbookDao.delete(guestbookVo);
	}
	
}
