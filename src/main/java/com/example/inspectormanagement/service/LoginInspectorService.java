package com.example.inspectormanagement.service;

import com.example.inspectormanagement.entity.LoginInspector;
import com.example.inspectormanagement.repository.LoginInspectorRepository;
import com.example.inspectormanagement.repository.WaitingApartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LoginInspectorService {
    @Autowired
    private WaitingApartRepository waitingApartRepository;
    @Autowired
    private LoginInspectorRepository loginInspectorRepository;

    public LoginInspector saveLoginInspector(LoginInspector loginInspector){
        return loginInspectorRepository.save(loginInspector);
    }
    public List<Map<String, Object>> getInspectorWorkCounts() {
        List<Object[]> results = waitingApartRepository.findWorkCountByInspector();
        List<Map<String, Object>> workCounts = new ArrayList<>();
        for (Object[] result : results) {
            Map<String, Object> map = new HashMap<>();
            map.put("id", result[0]);
            map.put("username", result[1]);
            map.put("workCount", result[2]);
            map.put("register_date", result[3]);
            workCounts.add(map);
        }
        return workCounts;
    }


}
