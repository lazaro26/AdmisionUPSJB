import { Component, OnInit, OnDestroy, ViewChild } from '@angular/core';
import { DataService } from 'src/app/services/data.service';
import { ISedes } from 'src/app/models/isedes';
import { IEspecialidades } from 'src/app/models/iEspecialidades';
import { Subscription } from 'rxjs';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginatorIntl, MatPaginator } from '@angular/material/paginator';
import { MatPaginatorIntlCro } from 'src/app/models/mat-paginator-intl-cro';
import { MatSort } from '@angular/material/sort';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { FormGroup, FormBuilder ,Validators} from '@angular/forms';
import { IPostulante } from 'src/app/models/ipostulante';

@Component({
  selector: 'app-pos-lista',
  templateUrl: './pos-lista.component.html',
  styles: [],
  providers: [{ provide: MatPaginatorIntl, useClass: MatPaginatorIntlCro }],
})
export class PosListaComponent implements OnInit {
  @ViewChild(MatPaginator, { static: true }) paginator: MatPaginator;
  @ViewChild(MatSort, { static: true }) sort: MatSort;

  Postulantes: MatTableDataSource<IPostulante>;
  formBuscar : FormGroup;
  Sedes: ISedes[];
  Especialidades: IEspecialidades[];
  subRef$: Subscription;
  displayedColumns: string[] = ['fecreg','codalu','numdoc','apepat','apemat','nomalu'];
  cargando = true;

  constructor(
    private dataService: DataService,
    formBuilder: FormBuilder,
  ) {


    this.formBuscar = formBuilder.group({
      Sede: ['', Validators.required], 
      Especialidad : ['', Validators.required]
    });

   }

  ngOnInit() {
    this.ListarSedes ();
    this.ListarEspecialidades();
    

  }

  ListarSedes (){
    const url = 'https://webupsjb-app.azurewebsites.net/api/Sedes/listar';
    this.subRef$ = this.dataService.get<ISedes[]>(url)
      .subscribe(res => {
        this.Sedes =  (res.body);
      },
        err => {
          console.log('Error al recuperar las sedes', err);
        });
  }

  ListarEspecialidades (){
    const url = 'https://webupsjb-app.azurewebsites.net/api/Especialidades/listar';
    this.subRef$ = this.dataService.get<IEspecialidades[]>(url)
      .subscribe(res => {
        this.Especialidades = res.body;
      },
        err => {
          console.log('Error al recuperar las Especialidades', err);
        });
  }


  Buscar(){

    const datosPostulante: IPostulante = {
      id_postulante : 0,
      numdoc: "",
      codesp: "01",
      codsed: "01",
    };

    const url = 'https://webupsjb-app.azurewebsites.net/api/Postulante/listar';
    this.subRef$ = this.dataService.get<IPostulante[]>(url,datosPostulante)
      .subscribe(res => {
        this.Postulantes = new MatTableDataSource<IPostulante>(res.body);
        this.Postulantes.paginator = this.paginator;
        this.Postulantes.sort = this.sort;
      },
        err => {
          console.log('Error al recuperar los clientes', err);
        });
  }



}
