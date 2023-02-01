import { Scene } from 'ponczek/src/core/scene';
import { Screen } from 'ponczek/src/gfx/screen';
import { Color } from 'ponczek/src/gfx/color';

export class HelloWorldScene extends Scene {
  update(): void { }

  render(scr: Screen): void {
    scr.clearScreen(Color.black);
    scr.drawText('Hello world, Ponczku!', 10, 10, Color.white);
  }
}
