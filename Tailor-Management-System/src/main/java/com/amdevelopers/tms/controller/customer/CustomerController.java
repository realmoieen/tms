/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.amdevelopers.tms.controller.customer;

//import com.amdevelopers.datatable.pagination.SimplePaginator;
//import com.amdevelopers.datatable.pagination.TablePaginator;
//import com.amdevelopers.datatable.pagination.model.PaginationCriteria;
//import com.amdevelopers.datatable.pagination.model.TablePage;
import com.amdevelopers.logger.ConsoleLogger;
import com.amdevelopers.tms.alerts.UserAlerts;
import com.amdevelopers.tms.database.Customer;
import com.amdevelopers.tms.database.dto.CustomerDTO;
import com.amdevelopers.tms.enums.MeasureEnums;
import com.amdevelopers.tms.repositories.CustomerRepository;
import com.amdevelopers.tms.services.CustomerService;
import com.amdevelopers.tms.validator.CustomerValidator;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Moieen Abbas
 */
@Controller
public class CustomerController {

    private final ConsoleLogger logger = new ConsoleLogger(this.getClass());

    @Autowired
    private CustomerValidator cutomerValidator;

    @Autowired
    private CustomerService customerService;

    @Autowired
    CustomerRepository customerRepo;

    @GetMapping("/customers")
    public String listCustomers(Model model) {
        logger.logDebug("Redirecting to list customer page.");
        return "customer/list_customers";
    }

    @GetMapping("/customers/list")
    public String list(Model model) {
        logger.logDebug("Redirecting to list customer page.");
        return "customer/list_customers_1";
    }

//    @RequestMapping(value = "/customers/page", method = RequestMethod.GET)
//    public @ResponseBody
//    Page<Customer> getCustomerPage(Pageable pageable) {
//        Page<Customer> findAll = customerRepo.findAll(pageable);
////                findAll.set
////        Hibernate.initialize(findAll);
//        return findAll;
//
//    }
    @GetMapping("/customers/initInsert")
    public String initInsertCustomer(Model model) {
        model.addAttribute("customerForm", new Customer());
        model.addAttribute("list_daman", MeasureEnums.Daman.values());
        model.addAttribute("list_neckStyles", MeasureEnums.NeckStyle.values());
        model.addAttribute("method", "insert");
        logger.logDebug("Redirecting to create customer page.");
        return "customer/manage_customer";
    }

    @PostMapping("/customers/insert")
    public String insert(@ModelAttribute("customerForm") Customer customerForm, BindingResult bindingResult, Model model) {
        logger.logInfo("new customer inserting.validating inputs");
        cutomerValidator.validate(customerForm, bindingResult);
        if (bindingResult.hasErrors()) {
            logger.logDebug("Validation error on user inputs redirecting again to insert page");
            model.addAttribute("list_daman", MeasureEnums.Daman.values());
            model.addAttribute("list_neckStyles", MeasureEnums.NeckStyle.values());
            model.addAttribute("method", "insert");
            return "customer/manage_customer";
        }
        logger.logDebug("User inputs are validated successfully.");
        if (customerService.insertNew(customerForm)) {
            UserAlerts.addAlert(UserAlerts.NOTICE, "Customer record successfully inserted");
            return "redirect:/customers/";
        } else {
            return "customer/manage_customer";
        }
    }

    @GetMapping("/customers/initUpdate")
    public String initUpdateCustomer(Model model, @Valid @RequestParam(name = "customerId", required = true) Long customerId) {
//        CustomerDTO obj_customerDTO;
        try {
            Customer obj_customer = customerRepo.findByCustomerId(customerId);
            if (null != obj_customer) {
//                obj_customerDTO = CustomerDTO.getConverter().apply(obj_customer);
                model.addAttribute("customerForm", obj_customer);
                model.addAttribute("list_daman", MeasureEnums.Daman.values());
                model.addAttribute("list_neckStyles", MeasureEnums.NeckStyle.values());
                model.addAttribute("method", "update");
                logger.logDebug("updating customer");
            } else {
                UserAlerts.addAlert(UserAlerts.ERROR, "Record not found to update.");
                return "customer/list_customers";
            }
        } catch (Exception e) {
            logger.logExecption(e.getMessage(), e);
        }
        return "customer/manage_customer";
    }

    @PostMapping("/customers/update")
    public String update(@ModelAttribute("customerForm") Customer customerForm, BindingResult bindingResult, Model model) {
        logger.logInfo("updating customer " + customerForm.getCustomerName() + " .validating inputs");
        Customer obj_customer = customerRepo.findByCustomerId(customerForm.getCustomerId());
        if (null == obj_customer) {
            UserAlerts.addAlert(UserAlerts.ERROR, "Customer not found");
            return "redirect:/customers/";
        }
        cutomerValidator.validate(customerForm, bindingResult);
        if (bindingResult.hasErrors()) {
            logger.logDebug("Validation error on user inputs redirecting again to insert page");
            model.addAttribute("list_daman", MeasureEnums.Daman.values());
            model.addAttribute("list_neckStyles", MeasureEnums.NeckStyle.values());
            model.addAttribute("method", "update");
            return "customer/manage_customer";
        }
        logger.logDebug("User inputs are validated successfully.");
        try {
            if (customerService.update(customerForm)) {
                UserAlerts.addAlert(UserAlerts.NOTICE, "Customer record successfully updated");
                return "redirect:/customers/";
            } else {
                UserAlerts.addAlert(UserAlerts.ERROR, "Failed to upated record");
                return "customer/manage_customer";
            }
        } catch (Exception e) {
            logger.logExecption("Failed to update Customer", e);
            UserAlerts.addAlert(UserAlerts.ERROR, e.getMessage());
            return "redirect:/customers/";
        }
    }
}
