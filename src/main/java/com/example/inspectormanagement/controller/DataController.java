package com.example.inspectormanagement.controller;

import com.example.inspectormanagement.entity.LoginInspector;
import com.example.inspectormanagement.entity.WaitingApart;
import com.example.inspectormanagement.repository.LoginInspectorRepository;
import com.example.inspectormanagement.repository.UserRepository;
import com.example.inspectormanagement.repository.WaitingApartRepository;
import com.example.inspectormanagement.service.LoginInspectorService;
import com.example.inspectormanagement.service.ReportService;
import com.example.inspectormanagement.service.WaitingApartService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Slf4j
@CrossOrigin(origins = "*")
@RestController
@RequestMapping("/data")
public class DataController {
    @Autowired
    private WaitingApartRepository waitingApartRepository;
    @Autowired
    private WaitingApartService waitingApartService;
    @Autowired
    private LoginInspectorService loginInspectorService;
    @Autowired
    private LoginInspectorRepository loginInspectorRepository;
    @Autowired
    private ReportService reportService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/waitingApart")
    public ResponseEntity<WaitingApart> saveWaitingApart(@RequestBody WaitingApart waitingApart) {
        return ResponseEntity.ok(waitingApartService.saveWaitingApart(waitingApart));
    }

    @PostMapping("/inspector")
    public ResponseEntity<LoginInspector> saveLoginInspector(@RequestBody LoginInspector loginInspector) {
        return ResponseEntity.ok(loginInspectorService.saveLoginInspector(loginInspector));
    }

    @GetMapping("/waiting-apart-list")
    public ResponseEntity<List<WaitingApart>> getAllWaitingApart() {
        List<WaitingApart> waitingApartList = waitingApartRepository.findAll();
        return ResponseEntity.ok(waitingApartList);
    }

    @GetMapping("/inspector-list")
    public ResponseEntity<List<Map<String, Object>>> getAllInspectors() {
        List<Map<String, Object>> inspectors = loginInspectorService.getInspectorWorkCounts();
        return ResponseEntity.ok(inspectors);
    }
    @GetMapping("/inspectors")
    public ResponseEntity<List<LoginInspector>> getAllInspectorsNames() {
        List<LoginInspector> inspectors = loginInspectorRepository.findAll();
        return ResponseEntity.ok(inspectors);
    }
    @PostMapping("/waiting-apart/assign-inspector")
    public ResponseEntity<?> assignInspector(@RequestParam Integer waitingApartId, @RequestParam Integer inspectorId) {
        WaitingApart waitingApart = waitingApartRepository.findById(waitingApartId).orElse(null);
        if (waitingApart == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("WaitingApart not found");
        }
        LoginInspector inspector = loginInspectorRepository.findById(inspectorId).orElse(null);
        if (inspector == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Inspector not found");
        }

        waitingApart.setLoginInspector(inspector);
        waitingApartRepository.save(waitingApart);

        return ResponseEntity.ok().build();
    }
    @GetMapping("/reports/waitingApart/{waitingApartId}/view")
    public ResponseEntity<Resource> viewReportByWaitingApartId(@PathVariable int waitingApartId) {
        byte[] reportContent = reportService.getReportContentByWaitingApartId(waitingApartId);

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline")
                .body(new ByteArrayResource(reportContent));
    }



}
