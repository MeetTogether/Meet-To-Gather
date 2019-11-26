package com.meetogether.eeit10936.pairs.service.impl;

import java.sql.Blob;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.meetogether.eeit10901.service.MemberService;
import com.meetogether.eeit10936.friends.model.FriendList;
import com.meetogether.eeit10936.friends.service.IFriendService;
import com.meetogether.eeit10936.pairs.dao.IMemberDao;
import com.meetogether.eeit10936.pairs.model.IMember;
import com.meetogether.eeit10936.pairs.model.Pair;
import com.meetogether.eeit10936.pairs.model.PairPK;
import com.meetogether.eeit10936.pairs.service.IPairsService;

@Service
//@Scope("session")
public class IPairsServiceImpl implements IPairsService {
	@Autowired
	@Qualifier("dao")
	private IMemberDao pdao;
	
	@Autowired
	private MemberService mService;
	@Autowired
	private IFriendService fService;

	@Transactional
	@Override
	public IMember getMemberById(int id) {
		return pdao.findByMemberId(id);
	}

	@Transactional
	@Override
	public List<IMember> getAllMember(Integer currentUserId) {
		return pdao.findAllMember();
	}

	@Transactional
	@Override
	public void likeOrDont(Integer currentUserId, Integer daterId, Integer status) {
		pdao.insertPairList(currentUserId, daterId, status);
	}

	@Transactional
	@Override
	public IMember back(Integer currentUserId) {
		IMember member = pdao.lastDontLike(currentUserId);
		PairPK pairPk = new PairPK(currentUserId, member.getMemberBasic().getMemberId());
		Pair pair = new Pair();
		pair.setPairPK(pairPk);
		pdao.deletePairList(pair);
		return member;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> cityScore(String currentUserCity, Integer currentUserId) {
		int score = 3;
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		pdao.findByCity(currentUserCity).forEach((i) -> {
			scoreMap.put(i, score);

		});
		mService.selectALL().forEach((i)->{
			scoreMap.compute(i.getMemberId(), (k, v) -> (v == null) ? 0 : scoreMap.get(k));
		});

		
		return scoreMap;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> interestScore(Integer currentUserId) {
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		int score = 3;
		pdao.findInterestByMemberId(currentUserId).forEach((interestid) -> {
			pdao.findMemberByInterestId(interestid).forEach((memberid) -> {
				scoreMap.compute(memberid, (k, v) -> (v == null) ? score : scoreMap.get(k) + score);
			});

		});
		
		return scoreMap;
	}

	private Integer hscore(IMember member, IMember currentMember) {
		int score = 0;
		
		Math.abs(member.getMemberInfo().getBodyType().equals(currentMember.getMemberHope().getBodyType()) ? score++
				: score);
		Math.abs(member.getMemberInfo().getMarriage().equals(currentMember.getMemberHope().getMarriage()) ? score++
				: score);
		Math.abs(member.getMemberInfo().getSmoking().equals(currentMember.getMemberHope().getSmoking()) ? score++
				: score);
		Math.abs(member.getMemberInfo().getDrink().equals(currentMember.getMemberHope().getDrink()) ? score++ : score);
		Math.abs(member.getMemberInfo().getEducation().equals(currentMember.getMemberHope().getEducation()) ? score++
				: score);
		Math.abs(member.getMemberInfo().getEthnicity().equals(currentMember.getMemberHope().getEthnicity()) ? score++
				: score);
		Math.abs(member.getMemberInfo().getReligion().equals(currentMember.getMemberHope().getReligion()) ? score++
				: score);
		Math.abs(
				member.getMemberInfo().getSalary().equals(currentMember.getMemberHope().getSalary()) ? score++ : score);
		return score;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> memberHopeScore(Integer currentUserId) {
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		IMember currentMember = pdao.findByMemberId(currentUserId);
		if(currentMember.getMemberHope()==null) {
			scoreMap.put(currentUserId, 0);
			return scoreMap;
		}
		pdao.findAllMember().forEach((member) -> {
			scoreMap.put(member.getMemberBasic().getMemberId(), hscore(member, currentMember));

		});

		
		return scoreMap;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> finalscoreMap(String currentUserCity, Integer currentUserId, List<Integer> pairList) {
		Map<Integer, Integer> cityMap = cityScore(currentUserCity, currentUserId);
		Map<Integer, Integer> interestMap = interestScore(currentUserId);
		Map<Integer, Integer> memberHopeMap = memberHopeScore(currentUserId);

		interestMap.forEach((ik, iv) -> {
			cityMap.compute(ik, (k, v) -> (v == null) ? iv : v + iv);
		});

		memberHopeMap.forEach((mk, mv) -> {
			cityMap.compute(mk, (k, v) -> (v == null) ? mv : v + mv);
		});
		cityMap.remove(currentUserId);
		if(pairList!=null) {
			pairList.forEach((i) -> {
				cityMap.remove(i);
			});
		}
		List<FriendList> fList = fService.findFriendsById(currentUserId);
		fList.forEach((i) -> {
			if (i.getMemberId().equals(currentUserId)) {
				cityMap.remove(i.getFriendId());
			}else {
				cityMap.remove(i.getMemberId());
			}
			
		});
		
	
		return cityMap;
	}

	@Transactional
	@Override
	public List<Integer> sortByDESValue(Map<Integer, Integer> unsorted) {
		LinkedHashMap<Integer, Integer> sortedMap = new LinkedHashMap<>();

		unsorted.entrySet().stream().sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
				.forEachOrdered(x -> sortedMap.put(x.getKey(), x.getValue()));

		return new ArrayList<>(sortedMap.keySet());
	}

	@Transactional
	@Override
	public Blob getPhotosById(Integer id, int status) {
		return pdao.getPhotosById(id, status);
	}

	@Transactional
	@Override
	public boolean checkVip(Integer id) {
		// TODO Auto-generated method stub
		return pdao.checkVip(id);
	}

	@Transactional
	@Override
	public IMember findMemberByChoice(Integer id, Integer sex, String city, Date stdate, Date eddate) {
		return pdao.findMemberByChoice(id, sex, city, stdate, eddate);

	}

	@Transactional
	@Override
	public List<Integer> findInterestByMemberId(Integer currentUserId) {
		// TODO Auto-generated method stub
		return pdao.findInterestByMemberId(currentUserId);
	}

	@Transactional
	@Override
	public String findInteretByInterestId(Integer interestId) {
		// TODO Auto-generated method stub
		return pdao.findInteretByInterestId(interestId);
	}

	@Transactional
	@Override
	public Long checkAlreadyPairs(Integer id) {
		// TODO Auto-generated method stub
		return pdao.checkAlreadyPairs(id);
	}

	@Transactional
	@Override
	public List<Integer> getPaired(Integer id) {
		// TODO Auto-generated method stub
		return pdao.getPaired(id);
	}
	@Transactional
	@Override
	public Long countAlbum(Integer id) {
		// TODO Auto-generated method stub
		return pdao.countAlbum(id);
	}

}
