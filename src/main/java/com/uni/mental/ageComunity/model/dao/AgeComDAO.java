package com.uni.mental.ageComunity.model.dao;

import com.uni.mental.ageComunity.model.dto.AgeComDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AgeComDAO {
    int registAgeCom(AgeComDTO ageCom);
    AgeComDTO selectOne(int no);

    List<AgeComDTO> findAllView();

    int updateAgeCom(AgeComDTO ageCom);

    int deleteAgeCom(int no);

}
