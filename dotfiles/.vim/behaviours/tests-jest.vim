iabbrev jestlint /* global describe, it, expect */

iabbrev jestdesc describe('', function () {<cr>})<Up><right><right><right><right><right><right><right><right>

iabbrev jestit it('', function () {<cr>})<Up><right><right>

iabbrev jestrenders it('renders', function () {
\<cr>const tree = renderer.create().toJSON()
\<cr>expect(tree).toMatchSnapshot()<cr>})<Up><Up><right><right><right><right><right><right><right><right><right><right>

iabbrev skatanafas skataremalaka

iabbrev jestcontainer let container = null;
\<cr>beforeEach(() => {
\<cr>container = document.createElement("div");
\<cr>document.body.appendChild(container);
\<cr>});
\<cr>
\<cr>afterEach(() => {
\<cr>unmountComponentAtNode(container);
\<cr>container.remove();
\<cr>container = null;
\<cr>});

