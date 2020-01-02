package com.example.spring02.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.board.dto.BoardVO;
import com.example.spring02.service.board.BoardPager;
import com.example.spring02.service.board.BoardService;
import com.example.spring02.service.board.ReplyService;



@Controller	
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	

	@Inject
	BoardService boardService;
	@Inject
	ReplyService replyService;
	
	// 01. 寃뚯떆湲� 紐⑸줉
	@RequestMapping("list.do")
	// @RequestParam(defaultValue="") ==> 湲곕낯媛� �븷�떦
	public ModelAndView list(@RequestParam(defaultValue="title") String searchOption,
							@RequestParam(defaultValue="") String keyword,
							@RequestParam(defaultValue="1") int curPage) throws Exception{
		// �젅肄붾뱶�쓽 媛��닔 怨꾩궛
		int count = boardService.countArticle(searchOption, keyword);
		// �럹�씠吏� �굹�늻湲� 愿��젴 泥섎━
		BoardPager boardPager = new BoardPager(count, curPage);
		int start = boardPager.getPageBegin();
		int end = boardPager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		
		// �뜲�씠�꽣瑜� 留듭뿉 ���옣
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // list
		map.put("count", count); // �젅肄붾뱶�쓽 媛��닔
		map.put("searchOption", searchOption); // 寃��깋�샃�뀡
		map.put("keyword", keyword); // 寃��깋�궎�썙�뱶
		map.put("boardPager", boardPager);
		// ModelAndView - 紐⑤뜽怨� 酉�
		ModelAndView mav = new ModelAndView();
		/*mav.addObject("list", list); // �뜲�씠�꽣瑜� ���옣
		mav.addObject("count", count);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);*/
		mav.addObject("map", map); // 留듭뿉 ���옣�맂 �뜲�씠�꽣瑜� mav�뿉 ���옣
		mav.setViewName("board/list"); // 酉곕�� list.jsp濡� �꽕�젙
		return mav; // list.jsp濡� List媛� �쟾�떖�맂�떎.
	}
	// 02_01. 寃뚯떆湲� �옉�꽦�솕硫�
	// @RequestMapping("board/write.do")
	// value="", method="�쟾�넚諛⑹떇"
	@RequestMapping(value="write.do", method=RequestMethod.GET)
	public String write(){
		return "board/write"; // write.jsp濡� �씠�룞
	}
	
	// 02_02. 寃뚯떆湲� �옉�꽦泥섎━
	@RequestMapping(value="insert.do", method=RequestMethod.POST)
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) throws Exception{
		// session�뿉 ���옣�맂 userId瑜� writer�뿉 ���옣
		String writer = (String) session.getAttribute("userId");
		// vo�뿉 writer瑜� �꽭�똿
		vo.setWriter(writer);
		boardService.create(vo);
		return "redirect:list.do";
	}
	
	// 03. 寃뚯떆湲� �긽�꽭�궡�슜 議고쉶, 寃뚯떆湲� 議고쉶�닔 利앷� 泥섎━
	// @RequestParam : get/post諛⑹떇�쑝濡� �쟾�떖�맂 蹂��닔 1媛�
	// HttpSession �꽭�뀡媛앹껜
	@RequestMapping(value="view.do", method=RequestMethod.GET)
	public ModelAndView view(@RequestParam int bno, @RequestParam int curPage, @RequestParam String searchOption,
							@RequestParam String keyword, HttpSession session) throws Exception{
		// 議고쉶�닔 利앷� 泥섎━
		boardService.increaseViewcnt(bno, session);
		// 紐⑤뜽(�뜲�씠�꽣)+酉�(�솕硫�)瑜� �븿猿� �쟾�떖�븯�뒗 媛앹껜
		ModelAndView mav = new ModelAndView();
		// 酉곗쓽 �씠由�
		mav.setViewName("board/view");
		// 酉곗뿉 �쟾�떖�븷 �뜲�씠�꽣
		// �뙎湲��쓽 �닔 : �뙎湲��씠 議댁옱�븯�뒗 寃뚯떆臾쇱쓽 �궘�젣泥섎━ 諛⑹��븯湲� �쐞�빐
		mav.addObject("count", replyService.count(bno)); 
		mav.addObject("dto", boardService.read(bno));
		mav.addObject("curPage", curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
		logger.info("mav:", mav);
		return mav;
	}
	
	// 04. 寃뚯떆湲� �닔�젙
	// �뤌�뿉�꽌 �엯�젰�븳 �궡�슜�뱾�� @ModelAttribute BoardVO vo濡� �쟾�떖�맖
	@RequestMapping(value="update.do", method=RequestMethod.POST)
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:list.do";
	}
	
	// 05. 寃뚯떆湲� �궘�젣
	@RequestMapping("delete.do")
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:list.do";
	}
	
	// 06. 寃뚯떆湲� 泥⑤��뙆�씪 紐⑸줉
	// http://loacalhost/spring02/board/getAttach/1
	// @PathVariable : parameter媛� �븘�땶 url�뿉 �룷�븿�맂 蹂��닔
	// @RequestParam : parameter蹂��닔
	@RequestMapping("/getAttach/{bno}")
	@ResponseBody // view媛� �븘�땶 data瑜� 由ы꽩
	public List<String> getAttach(@PathVariable("bno") int bno){
		return boardService.getAttach(bno);
	}
	 
}
