#!/bin/bash
set -e

for i in $*; do
	sed \
		-e "s/59 Temple Place, Suite 330/51 Franklin Street, Fifth Floor/g" \
		-e "s/59 Temple Place - Suite 330/51 Franklin Street - Fifth Floor/g" \
		-e "s/Boston, MA 02111-1307, USA/Boston, MA 02111-1301, USA/g" \
		-e "s/Boston, MA 02111-1307  USA/Boston, MA 02111-1301  USA/g" \
		-e "s/Boston, MA  02111-1307 USA/Boston, MA  02111-1301 USA/g" \
		-e "s/Boston, MA  02111-1307, USA/Boston, MA  02111-1301, USA/g" \
		-e "s/Boston, MA  02111-1307  USA/Boston, MA  02111-1301  USA/g" \
		< "$i" > "$i.fixed"
	mv "$i.fixed" "$i"
done
