package com.techelevator.dao;

import com.techelevator.model.Plan;

import java.util.List;

public interface PlanDao {

    Plan findPlanById(Long planId);

    List<Plan> findPlansByUserId(Long userId);

    boolean createPlan(Long userId, String planName);
}

