-- dirty hooking - same as luna
function CooldownFrame_OnUpdateModel()
	if ( this.stopping == 0 ) then
		local finished = (GetTime() - this.start) / this.duration;
		if ( finished < 1.0 ) then
			if this.reverse then
				finished = 1-finished
			end
			local time = finished * 1000;
			this:SetSequenceTime(0, time);
			return;
		end
		this.stopping = 1;
		this:SetSequence(1);
		this:SetSequenceTime(1, 0);
	else
		this:AdvanceTime();
	end
end