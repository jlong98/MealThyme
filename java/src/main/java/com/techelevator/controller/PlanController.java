package com.techelevator.controller;

import com.techelevator.dao.PlanDao;
import com.techelevator.model.*;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.validation.Valid;
import java.math.BigDecimal;
import java.util.List;

@RestController
@PreAuthorize("isAuthenticated()")
@CrossOrigin
public class PlanController {
    private PlanDao planDao;

    public PlanController(PlanDao planDao) {this.planDao = planDao;}

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/plans/{id}", method = RequestMethod.GET)
    public Plan getPlan(@PathVariable Long id) {
        return planDao.findPlanById(id);
    }

    @PreAuthorize("permitAll")
    @RequestMapping(path = "/user/{id}/plans", method = RequestMethod.GET)
    public List<Plan> findPlansByUserId(@PathVariable Long id) {
        return planDao.findPlansByUserId(id);
    }

    @PreAuthorize("permitAll")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(value = "/{id}/plan", method = RequestMethod.POST)
    public void createPlan(@PathVariable Long id, @RequestBody Plan plan) {
        if (!planDao.createPlan(id, plan.getPlanName())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Failed to create plan");
        }

    }
}