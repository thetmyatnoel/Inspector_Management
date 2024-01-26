package com.example.inspectormanagement.service;

import com.example.inspectormanagement.entity.Report;
import com.example.inspectormanagement.repository.ReportRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportService {
    @Autowired
    private ReportRepository reportRepository;
    public byte[] getReportContentByWaitingApartId(int waitingApartId) {
        Report report = reportRepository.findByWaitingApartId(waitingApartId)
                .orElseThrow(() -> new RuntimeException("Report not found for given WaitingApart ID"));

        return report.getContent();
    }
}
