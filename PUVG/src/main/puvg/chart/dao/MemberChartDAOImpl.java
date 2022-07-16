package main.puvg.chart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import main.puvg.chart.vo.MemberChartVO;

@Repository
public class MemberChartDAOImpl implements MemberChartDAO {
	
	@Autowired(required=false)
	private SqlSession sqlSession;
	
	public List<MemberChartVO> ChartData() {
		return sqlSession.selectList("ChartData");
	}
}
