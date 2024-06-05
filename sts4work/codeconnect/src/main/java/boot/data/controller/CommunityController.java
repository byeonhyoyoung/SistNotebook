package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.CommunityDto;
import boot.data.service.CommunityServiceInter;

@Controller
public class CommunityController {

    @Autowired
    CommunityServiceInter service;
    
    @GetMapping("/")
    public String start() {
        return "layout/main";
    }
    
    @GetMapping("/community/list")
    public ModelAndView list() {
        ModelAndView mview = new ModelAndView();
        
        int totalCount = service.getTotalCount();
        List<CommunityDto> list = service.getAllDatas();
        
        mview.addObject("totalCount", totalCount);
        mview.addObject("list", list);
        
        mview.setViewName("community/homelist");
        return mview;
    }
    
    @GetMapping("/community/writeform")
    public String form() {
        return "community/homeform";
    }
    
    @PostMapping("/community/insert")
    public String insert(@ModelAttribute CommunityDto dto,
                         @RequestParam ArrayList<MultipartFile> upload,
                         HttpSession session) {
        
        String path = session.getServletContext().getRealPath("/communityimage");
        String uploadName = "";
        
        if(upload.get(0).getOriginalFilename().equals(""))
            uploadName = "no";
        else {
            for(MultipartFile f : upload) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String fName = sdf.format(new Date()) + "_" + f.getOriginalFilename();
                uploadName += fName + ",";
                
                try {
                    f.transferTo(new File(path + "\\" + fName));
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
            
            uploadName = uploadName.substring(0, uploadName.length() - 1);
        }
        
        dto.setCom_photo(uploadName);
        service.insertCommunity(dto);
        return "redirect:/community/list";
    }
    
    @GetMapping("/community/updateform")
    public String updateform(@RequestParam String com_num, Model model) {
        CommunityDto dto = service.getData(com_num);
        model.addAttribute("dto", dto);
        return "community/homeupdateform";
    }
    
    @PostMapping("/community/update")
    public String update(@ModelAttribute CommunityDto dto,
                         @RequestParam ArrayList<MultipartFile> upload,
                         HttpSession session) {
        
        String path = session.getServletContext().getRealPath("/communityimage");
        String uploadName = "";
        
        if(upload.get(0).getOriginalFilename().equals(""))
            uploadName = "null";
        else {
            for(MultipartFile f : upload) {
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
                String fName = sdf.format(new Date()) + "_" + f.getOriginalFilename();
                uploadName += fName + ",";
                
                try {
                    f.transferTo(new File(path + "\\" + fName));
                } catch (IllegalStateException | IOException e) {
                    e.printStackTrace();
                }
            }
            
            uploadName = uploadName.substring(0, uploadName.length() - 1);
        }
        
        dto.setCom_photo(uploadName);
        service.updateCommunity(dto);
        return "redirect:/community/list";
    }
    
    @GetMapping("/community/delete")
    public String delete(@RequestParam String com_num) {
        service.deleteCommunity(com_num);
        return "redirect:/community/list";
    }
    
    @GetMapping("/community/detail")
    public ModelAndView detail(@RequestParam String com_num) {
        ModelAndView mview = new ModelAndView();
        
        CommunityDto dto = service.getData(com_num);
        
        mview.addObject("dto", dto);
        
        mview.setViewName("community/homedetail");
        return mview;
    }
    
    @GetMapping("/community/interviewlist")
    public String interviewlist() {
        return "community/interviewlist";
    }
}
