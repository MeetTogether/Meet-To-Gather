package com.meetogether.eeit10936.service.impl;

import java.sql.Blob;
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

import com.meetogether.eeit10936.dao.IMemberDao;
import com.meetogether.eeit10936.model.IMember;
import com.meetogether.eeit10936.model.Pair;
import com.meetogether.eeit10936.model.PairPK;
import com.meetogether.eeit10936.service.IPairsService;

@Service
//@Scope("session")
public class IPairsServiceImpl implements IPairsService {
	@Autowired
	@Qualifier("dao")
	private IMemberDao dao;

	@Transactional
	@Override
	public IMember getMemberById(int id) {
		return dao.findByMemberId(id);
	}

	@Transactional
	@Override
	public List<IMember> getAllMember() {
		return dao.findAllMember();
	}

	@Transactional
	@Override
	public void likeOrDont(Integer currentUserId, Integer daterId, Integer status) {
		dao.insertPairList(currentUserId, daterId, status);
	}

	@Transactional
	@Override
	public IMember back(Integer currentUserId) {
		IMember member = dao.lastDontLike(currentUserId);
		PairPK pairPk = new PairPK(currentUserId, member.getMemberBasic().getMemberId());
		Pair pair = new Pair();
		pair.setPairPK(pairPk);
		dao.deletePairList(pair);
		return member;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> cityScore(String currentUserCity) {
		int score = 3;
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		dao.findByCity(currentUserCity).forEach((i) -> {
			scoreMap.put(i, score);
		});
		return scoreMap;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> interestScore(Integer currentUserId) {
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		int score = 3;
		dao.findInterestByMemberId(currentUserId).forEach((interestid) -> {
			dao.findMemberByInterestId(interestid).forEach((memberid) -> {
				scoreMap.compute(memberid, (k, v) -> (v == null) ? score : scoreMap.get(k) + score);
			});
		});
		return scoreMap;
	}

	@Transactional
	@Override
	public Map<Integer, Integer> memberHopeScore(Integer currentUserId) {
		Map<Integer, Integer> scoreMap = new HashMap<Integer, Integer>();
		IMember currentMember = dao.findByMemberId(currentUserId);
		dao.findAllMember().forEach((member) -> {
			int score = 0;
			Math.abs(member.getMemberInfo().getBodyType().equals(currentMember.getMemberHope().getBodyType()) ? score++
					: score);
			Math.abs(member.getMemberInfo().getMarriage().equals(currentMember.getMemberHope().getMarriage()) ? score++
					: score);
			Math.abs(member.getMemberInfo().getSmoking().equals(currentMember.getMemberHope().getSmoking()) ? score++
					: score);
			Math.abs(member.getMemberInfo().getDrink().equals(currentMember.getMemberHope().getDrink()) ? score++
					: score);
			Math.abs(
					member.getMemberInfo().getEducation().equals(currentMember.getMemberHope().getEducation()) ? score++
							: score);
			Math.abs(
					member.getMemberInfo().getEthnicity().equals(currentMember.getMemberHope().getEthnicity()) ? score++
							: score);
			Math.abs(member.getMemberInfo().getReligion().equals(currentMember.getMemberHope().getReligion()) ? score++
					: score);
			Math.abs(member.getMemberInfo().getSalary().equals(currentMember.getMemberHope().getSalary()) ? score++
					: score);
			scoreMap.put(member.getMemberBasic().getMemberId(), score);
		});
		return scoreMap;
	}

	@Override
	public Map<Integer, Integer> finalscoreMap(String currentUserCity, Integer currentUserId) {
		Map<Integer, Integer> cityMap = cityScore(currentUserCity);
		Map<Integer, Integer> interestMap = interestScore(currentUserId);
		Map<Integer, Integer> memberHopeMap = memberHopeScore(currentUserId);

		interestMap.forEach((ik, iv) -> {
			cityMap.compute(ik, (k, v) -> (v == null) ? iv : v + iv);
		});

		memberHopeMap.forEach((mk, mv) -> {
			cityMap.compute(mk, (k, v) -> (v == null) ? mv : v + mv);
		});
		cityMap.remove(currentUserId);
		return cityMap;
	}

	@Override
	public List<Integer> sortByDESValue(Map<Integer, Integer> unsorted) {
		LinkedHashMap<Integer, Integer> sortedMap = new LinkedHashMap<>();
		unsorted.entrySet().stream().sorted(Map.Entry.comparingByValue(Comparator.reverseOrder()))
				.forEachOrdered(x -> sortedMap.put(x.getKey(), x.getValue()));
		return new ArrayList<>(sortedMap.keySet());
	}

	@Transactional
	@Override
	public List<Blob> getPhotosById(IMember member) {
		return dao.getPhotosById(member);
	}
}
