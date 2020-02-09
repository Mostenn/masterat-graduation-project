import { Component, OnInit, Input } from '@angular/core';
import { ThemePalette } from '@angular/material/core';

@Component({
  selector: 'app-toolbar',
  templateUrl: './toolbar.component.html',
  styleUrls: ['./toolbar.component.scss']
})
export class ToolbarComponent implements OnInit {

  @Input() color: ThemePalette;
  @Input() backgroundColor: ThemePalette = "primary";
  isIconButton: boolean;

  constructor() { }

  ngOnInit() {
  }

}
