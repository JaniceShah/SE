import { Component, OnInit } from '@angular/core';
import { AuthService } from '../auth.service';
import * as XLSX from 'xlsx';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-instructor',
  templateUrl: './instructor.component.html',
  styleUrls: ['./instructor.component.css']
})
export class InstructorComponent implements OnInit {

  dataForm: FormGroup;
  selectedFile=null;
  csvContent: string;
 
  constructor(private authService: AuthService,
    private formBuilder:FormBuilder) {
      this.dataForm = formBuilder.group({
        uploading:['',Validators.required],
      });
     }


  logout() {
    this.authService.logOut()
  }
  arrayBuffer:any;
  file=null;
  myFunction() {
    var x = document.getElementById("slot");
    if (x.style.display === "none") {
    x.style.display = "block";
    } else {
    x.style.display = "none";
    }
    }
    OnSubmit(data){
      const reader = new FileReader();
      function insert(data)
      { 
        reader.onload = function (e:any) {
        var d = e.target.result;
        console.log('d',d);
        d = new Uint8Array(d);
        var workbook = XLSX.read(d, {type: 'array'});
        console.log(workbook);
       
        workbook.SheetNames.forEach(function (sheetName) {
            var roa = XLSX.utils.sheet_to_json(workbook.Sheets[sheetName], {header: 1});
            console.log(roa[2][1]);
            for (var i = 1; i <= roa.length-1; i++) {
              console.log(roa[i]);
              data[i]=roa[i];
              console.log(data[i]);
           }
          });
        
          console.log(data);
        }
        return data;
    }
    
      reader.readAsArrayBuffer(this.selectedFile);
      const Merge = async () => {
        const a = await insert(data);
       };
      Merge().then(console.log);
    }
    
    onFileSelected(event,data){
      this.selectedFile=<File>event.target.files[0];
      console.log(this.selectedFile);
      this.OnSubmit(data);
    }
     
    ngOnInit() {}
  }