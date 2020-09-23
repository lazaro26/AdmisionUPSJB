import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder ,Validators} from '@angular/forms';
import { IPostulante} from 'src/app/models/ipostulante';
import { Subscription } from 'rxjs';
import { DataService } from 'src/app/services/data.service';
import { MatTableDataSource } from '@angular/material/table';

@Component({
  selector: 'app-pos-add',
  templateUrl: './pos-add.component.html',
  styles: []
})
export class PosAddComponent implements OnInit {
  cargando = false;
  formAgregarRegistro: FormGroup;
  postulantes: MatTableDataSource<IPostulante>;
  subRef$: Subscription;


  constructor(
    private dataService: DataService,
    formBuilder: FormBuilder,
  ) {

    this.formAgregarRegistro = formBuilder.group({
      numero: ['', Validators.required],  
    });


   }

  ngOnInit() {
  }

  ResgistrarAsistencia (){
    const datosPostulante: IPostulante = {
      id_postulante : 0,
      numdoc: this.formAgregarRegistro.value.numero,
      codesp:"",
      codsed:"",
    };

    console.log('datosCliente', datosPostulante);

    const url = 'https://webupsjb-app.azurewebsites.net/api/postulante/registrar';
    this.subRef$ = this.dataService.post<IPostulante[]>(url,
      datosPostulante)
      .subscribe(res => {
        this.cargando = false;
        this.postulantes = new MatTableDataSource<IPostulante>(res.body);
      },
        err => {
          console.log('Error al recuperar el postulante', err);
        });




  }


}


