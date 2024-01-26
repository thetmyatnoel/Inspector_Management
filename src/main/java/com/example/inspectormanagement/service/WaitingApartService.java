package com.example.inspectormanagement.service;

import com.example.inspectormanagement.entity.WaitingApart;
import com.example.inspectormanagement.repository.WaitingApartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WaitingApartService {
    @Autowired
    private WaitingApartRepository waitingApartRepository;

    public WaitingApart saveWaitingApart(WaitingApart waitingApart) {
        return waitingApartRepository.save(waitingApart);
    }
}
