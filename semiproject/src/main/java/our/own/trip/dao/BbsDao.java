package our.own.trip.dao;

import java.util.HashMap;
import java.util.List;

import our.own.trip.dto.BbsDto;
import our.own.trip.dto.BbsParam;
import our.own.trip.dto.BbsReplyDto;


public interface BbsDao {
	

	List<BbsDto> getshareList(BbsParam param);
	
	List<BbsDto> getreviewList(BbsParam param);
	
	int getshareAllBbs(BbsParam param);
	
	int getreviewAllBbs(BbsParam param);
	
	boolean shareWriteBbs(BbsDto bbs);
	
	boolean reviewWriteBbs(BbsDto bbs);

	void sharereadcount(BbsDto bbs);
	
	void reviewreadcount(BbsDto bbs);
	
	BbsDto sharegetBbs(int sseq);
	
	BbsDto reviewgetBbs(int sseq);
	
	boolean shareupdateBbs(BbsDto dto);
	
	boolean reviewupdateBbs(BbsDto dto);
	
	boolean sharedeleteBbs(int sseq);
	
	boolean reviewdeleteBbs(int sseq);
	
	List<BbsReplyDto> getsharereplyList(BbsDto bbs);
	
	List<BbsReplyDto> getreviewreplyList(BbsDto bbs);

	

}