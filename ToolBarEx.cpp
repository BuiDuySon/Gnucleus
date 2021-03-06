/********************************************************************************

	Gnucleus - An Application for the Gnutella Network
    Copyright (C) 2000-2003 John Marshall

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

	For support, questions, comments, etc...
	E-Mail:
		swabby@c0re.net

********************************************************************************/

// ToolBarEx.cpp : implementation file
//

#include "stdafx.h"
#include "Gnucleus.h"
#include "ToolBarEx.h"


// CToolBarEx

IMPLEMENT_DYNAMIC(CToolBarEx, CToolBar)
CToolBarEx::CToolBarEx()
{
	m_HaveFocus = true;
}

CToolBarEx::~CToolBarEx()
{
}


BEGIN_MESSAGE_MAP(CToolBarEx, CToolBar)

	ON_WM_CAPTURECHANGED()
	ON_WM_MOUSEMOVE()
	//ON_WM_PAINT()
END_MESSAGE_MAP()





void CToolBarEx::OnCaptureChanged(CWnd *pWnd)
{
	// TODO: Add your message handler code here

	CToolBar::OnCaptureChanged(pWnd);
}

void CToolBarEx::OnMouseMove(UINT nFlags, CPoint point)
{
	// TODO: Add your message handler code here and/or call default

	CToolBar::OnMouseMove(nFlags, point);
}

/*void CToolBarEx::OnPaint()
{
	CPaintDC dc(this); // device context for painting
	// TODO: Add your message handler code here
	// Do not call CToolBar::OnPaint() for painting messages

	CToolBar::OnPaint();
}*/
